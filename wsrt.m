fo='Y:\felles\PROTEOMICS and XRAY\Ani\Camilla\For Animesh_25102016.xlsx'
testtype=' WSRT'
[data,id,~]=xlsread(fo)
IDX=1;
idoff=6;
idx=1;
edx=9;
jmp=3;
idnm=id(:,IDX)
data(:,all(isnan(data), 1)) = []
id=id(1,~cellfun('isempty',id(1,:)))
pv=zeros(size(data,1),(edx-idx+1)/jmp)
ln=zeros(size(data,1),1)
hdr='Line '
for j = idx:jmp:edx
    pcvt=ceil(j/jmp)
    st=j
    en=j+jmp-1
    hdr=[hdr strcat(id(1,j+idoff),num2str(j),testtype)]
    for i = 1:size(data,1)
        ln(i)=ln(i)+i;
         if sum(isnan(data(i,st:en)))<(en-st+1)
            %pv(i,pcvt)=signrank(log2(data(i,st:en)/100));
            pv(i,pcvt)=signrank(data(i,st:en));
         else
            pv(i,pcvt)=1;
         end
    end
end
hist(pv)
ln=ln*jmp/(edx-idx+1)
xlswrite(strcat(fo,testtype,'un.xls'),[idnm [hdr;num2cell([ln pv])]])
