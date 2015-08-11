#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
#    Code base of Animesh Sharma [ sharma.animesh@gmail.com ]

# Plot a 3D function
use gifplot;
package gifplot;

# Here is the function to plot
sub func {
    my $x = shift;
    my $y = shift;
    return 5*cos(2*sqrt($x*$x+$y*$y))*exp(-0.3*sqrt($x*$x+$y*$y));
}

# Here are some plotting parameters
$xmin = -5.0;
$xmax =  5.0;
$ymin = -5.0;
$ymax =  5.0;
$zmin = -5.0;
$zmax =  5.0;

# Grid resolution
$nxpoints =  60;
$nypoints =  60;

$cmap  = new_ColorMap("cmap");
$frame = new_FrameBuffer(500,500);
FrameBuffer_clear($frame,$BLACK);

$p3    = new_Plot3D($frame,$xmin,$ymin,$zmin,$xmax,$ymax,$zmax);
Plot3D_lookat($p3,2*($zmax-$zmin));
Plot3D_autoperspective($p3,40);
Plot3D_rotu($p3,60);
Plot3D_rotr($p3,30);
Plot3D_rotd($p3,10);

sub drawsolid {
    Plot3D_clear($p3,$BLACK);
    Plot3D_start($p3);
    my $dx = 1.0*($xmax-$xmin)/$nxpoints;
    my $dy = 1.0*($ymax-$ymin)/$nypoints;
    my $cscale = 240.0/($zmax-$zmin);
    my $x = $xmin;
    for ($i = 0; $i < $nxpoints; $i++) {
	my $y = $ymin;
	for ($j = 0; $j < $nypoints; $j++) {
	    my $z1 = func($x,$y);
	    my $z2 = func($x+$dx,$y);
	    my $z3 = func($x+$dx,$y+$dy);
	    my $z4 = func($x,$y+$dy);
	    my $c1 = $cscale*($z1-$zmin);
	    my $c2 = $cscale*($z2-$zmin);
	    my $c3 = $cscale*($z3-$zmin);
	    my $c4 = $cscale*($z4-$zmin);
	    my $c = ($c1+$c2+$c3+$c4)/4;
	    if ($c < 0) { $c = 0; }
	    if ($c > 239) { $c = 239; }
	    Plot3D_solidquad($p3,$x,$y,$z1,$x+$dx,$y,$z2,$x+$dx,$y+$dy,$z3,$x,$y+$dy,$z4,$c+16);
	    $y = $y + $dy;
	}
	$x = $x + $dx;
    }
}

print "Making a nice 3D plot...\n";
drawsolid();

FrameBuffer_writeGIF($frame,$cmap,"image.gif");
print "Wrote image.gif\n";

