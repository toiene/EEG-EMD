
clear all;
cd('C:\Users\toiene\Desktop\EEG\seed_database\seed\seed_data\Preprocessed_EEG\Preprocessed_EEG');
file=dir('*mat');

for m=44:46  % 46��file
 
    load(file(m).name);
  
     %��ȡ�ļ������������֣�����Ϊÿ�������mat�ļ�ǰ׺
    name=file(m).name(1:end-4);
    
   
    for j=1:15
        cellname=['eeg',num2str(j),'_imf'];%Ϊcell����
        mareg=['eeg',num2str(j)];
        
    for i=1:62
        [imf]=emd(eval(['zjy_',mareg,'(',num2str(i),',:)']),'Interpolation','pchip','MaxNumIMF',20);%��ÿ��ʵ���е�ÿһ���ź���EMD�ֽ�,�õ���imf������ÿһ��Ϊһ��imf����
        imf=imf';
        eval([cellname,'{',num2str(i),'}=imf']);%��EMD�ֽ���ÿ��ʵ�����ݱ���Ϊһ��cell
    end
    path=['C:\Users\toiene\Desktop\EEG\EMD\emd_imf2\',name,'.mat'];%ÿ��ʵ����ÿ���ʵ�����ݱ���Ϊһ��mat�ļ�����45��ʵ�飩
    if j==1
        eval(['save("',path,'","',cellname,'")']);
    else
        eval(['save("',path,'","',cellname,'","-append")']);
    end  
    
    end
    
       
end

