fid=fopen('test.stl', 'r');%����һ��STL�ļ����ļ���test.stl
V=0;    vnum=0;    report_num=0;    STLxyz=0;
%��ȡ����
while feof(fid) == 0    %�ļ�ָ�뵽���ļ�ĩβʱ������ֵ            
      tline = fgetl(fid);   % tline��ö�ȡ�����ļ����ݵ�һ���ַ���
      fword = sscanf(tline, '%s');  %�ӻ�õ�һ���ַ�������ȡ�ַ�����
if strncmpi(fword, 'vertex',6) == 1;   %��ȡ����,���ָ����ָ��ַ����Ϊvertex���߼�Ϊ1
      STLxyz= sscanf(tline, '%*s %lf %lf %lf');%��ȡ���������ݴ��浽STLxyz,�����д洢
      vnum = vnum + 1; 
end
    if  vnum~=report_num
         report_num=vnum;
         v(:,vnum)=STLxyz;     
    end
end
vout = v';  
%�������
for i=1:3:vnum-2
    xi1=vout(i,1);     yi1=vout(i,2);     zi1=vout(i,3);
    xi2=vout(i+1,1);   yi2=vout(i+1,2);   zi2=vout(i+1,3);
    xi3=vout(i+2,1);   yi3=vout(i+2,2);   zi3=vout(i+2,3);
    vi=(-xi3*yi2*zi1+xi2*yi3*zi1+xi3*yi1*zi2-xi1*yi3*zi2-xi2*yi1*zi3+xi1*yi2*zi3)/6;
    V=V+vi;
end
fprintf('The volumn of the model is: %f mm3.\n',V);
%������f�ĸ�����
face=vnum/3;
fprintf('The number of the face is: %d.\n',face);
%���㲻�غ϶���ĸ���vertex��
DV=unique(vout,'rows');
[vertex,columns]=size(DV);
fprintf('The number of the vertex is: %d.\n',vertex);
%���㲻�غϱߵĸ���edge��
edge=vnum/2;
fprintf('The number of the edge is: %d.\n',edge);
%����׵ĸ�����
genus=(2-vertex+edge-face)/2;
fprintf('The number of the genus is: %d.\n',genus);



            
            
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        