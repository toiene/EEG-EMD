
clear all;
cd('C:\Users\toiene\Desktop\EEG\seed_database\seed\seed_data\Preprocessed_EEG\Preprocessed_EEG');
file=dir('*mat');

for m=44:46  % 46个file
 
    load(file(m).name);
  
     %提取文件名中姓名部分，可作为每个保存的mat文件前缀
    name=file(m).name(1:end-4);
    
   
    for j=1:15
        cellname=['eeg',num2str(j),'_imf'];%为cell命名
        mareg=['eeg',num2str(j)];
        
    for i=1:62
        [imf]=emd(eval(['zjy_',mareg,'(',num2str(i),',:)']),'Interpolation','pchip','MaxNumIMF',20);%对每次实验中的每一个信号做EMD分解,得到的imf矩阵中每一列为一个imf函数
        imf=imf';
        eval([cellname,'{',num2str(i),'}=imf']);%把EMD分解后的每次实验数据保存为一个cell
    end
    path=['C:\Users\toiene\Desktop\EEG\EMD\emd_imf2\',name,'.mat'];%每个实验者每天的实验数据保存为一个mat文件（共45次实验）
    if j==1
        eval(['save("',path,'","',cellname,'")']);
    else
        eval(['save("',path,'","',cellname,'","-append")']);
    end  
    
    end
    
       
end

