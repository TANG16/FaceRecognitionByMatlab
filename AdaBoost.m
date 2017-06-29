% 2017-5-21�޼�ѫ
% AdaBoost ѧϰ�㷨��ѵ����������Թ���
% AdaBoost
% �ṩAdaBoostѵ�������
% �㷨��Դ Robust Real-time Object Detection.pdf & һ���µ�adaboost����ѵ���㷨.PDF
%
% ѵ��T��,�����õ�1������T�ֵ�����,����������,ѵ��������,���Դ����ʵ�
% 
% AdaBoost ѧϰ�㷨 ����ѵ������Թ���
% AdaBoostClassfy            AdaBoost ѧϰ�㷨 ��һ���������з���
% AdaBoostWeakLearnerClassfy AdaBoost �������һ���������з���
% searchBestWeakLearner      ���������ϻ�����ŵ���ֵ������
% trainAdaBoostLearner       AdaBoost ѧϰ�㷨 ѵ������
% testAdaBoostLearner        AdaBoost ѧϰ�㷨 ���Թ���
% testAdaBoost(ѵ�������)    �������������Ϊѵ��������Լ������ѵ������AdaBoostѧϰ�㷨
% AdaBoost(ѵ�������)        ����ѵ��������Լ�,ѵ������AdaBoost������
% 
% testAdaBoost �� AdaBoost ���ƣ�������ѵ�����������
% testAdaBoost ���Զ�Σ����ҽ���������Ϊѵ��������Լ�
% testAdaBoost ͨ������ AdaBoost �������ж�ε� AdaBoost �㷨 ѵ�������
% AdaBoost���� trainAdaBoostLearner ѧϰ������
%         ���� testAdaBoostLearner ���Է�����
% 
% ����:
% trainX  ѵ�����ݼ�
% trainY  ѵ�����ݼ����
% T       ѵ������
% testX   �������ݼ�
% testY   �����������
% 
% 
% �����
% AdaBoostInfo �ṹ��
% �������³�Ա��
% Hypothesis        ѵ����ȡ����������,��T����������
%                   ÿ����������������� [��ֵ ƫ�� ������]
% AlphaT            ÿ������������Ȩֵ,Tά����
% trainError        ��ѵ�����ݼ�X�ϵ�1������T�ֵ�ѵ��������
% testError         �ڲ������ݼ�X�ϵ�1������T�ֵĲ��Դ�����
% TPRate            �ڲ��Լ��ϵ�1������T�ֵ� True-Positive   ����
% FPRate            �ڲ��Լ��ϵ�1������T�ֵ� Negative-True  ����
% costTime          ѵ����1������T�ֵĻ���ʱ��
%
% 
function [AdaBoostInfo]=AdaBoost(trainX,trainY,T,testX,testY)
[Hypothesis,AlphaT,trainErrorRate,costTime,trainTPRate,trainFPRate]=trainAdaBoostLearner(trainX,trainY,T);
[testErrorRate,testTPRate,testFPRate]=testAdaBoostLearner(testX,testY,Hypothesis,AlphaT,T);

AdaBoostInfo.Hypothesis=Hypothesis;         % ѵ����ȡ����������
AdaBoostInfo.AlphaT=AlphaT;                 % ÿ������������Ȩֵ
AdaBoostInfo.trainError=trainErrorRate;     % ѵ��������
AdaBoostInfo.trainTPRate=trainTPRate;       % ѵ�� True-Positive Rate
AdaBoostInfo.trainFPRate=trainFPRate;       % ѵ�� Negative-True Rate
AdaBoostInfo.testError=testErrorRate;       % ���Դ�����
AdaBoostInfo.testTPRate=testTPRate;         % ���� True-Positive Rate
AdaBoostInfo.testFPRate=testFPRate;         % ���� Negative-True Rate
AdaBoostInfo.costTime=costTime;             % ����ʱ��