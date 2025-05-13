function [BestPosition,BestScore,ConvergenceCurve] = PDPSO(VarMin,VarMax,nVar,nPop,MaxIt,CostFunction)
VarSize = [1,nVar];

c1=0.6;
c2=3.1;

VelMax=0.5*(VarMax-VarMin);
VelMin=-VelMax;

Position = VarMin + rand(nPop,nVar).*VarMax;
Velocity =zeros(nPop,nVar);
Cost=inf(1,nPop);
P_BestPos = Position;
P_BestCost = Cost;

nFoods = min([nPop round(sqrt(MaxIt))]);
FinallyFoods = 1;

VisitTable = zeros(nPop,nFoods);
for i = 1:nPop
    VisitTable(i,:)=randperm(nFoods);
end
historyVisitTable=VisitTable;
historyPosition = Position;

GBPosition = Position(1:nFoods,:);
GBCost = Cost(1:nFoods);

stop = zeros(1,nPop); 
historyTarget = zeros(1,nPop);
stopR = 50*ones(1,nPop);

BestCost=zeros(MaxIt,1);
for it=1:MaxIt

    for i=1:nPop
    
        [MaxUnvisitedTime,TargetFoodIndex]=max(VisitTable(i,:));
        MUT_Index=find(VisitTable(i,:)==MaxUnvisitedTime);
        if length(MUT_Index)>1
            [~,Ind]= min(GBCost(MUT_Index));
            TargetFoodIndex=MUT_Index(Ind);
        end
        VisitTable(i,:)=VisitTable(i,:)+1;
        VisitTable(i,TargetFoodIndex)=ceil(rand*VisitTable(i,TargetFoodIndex));
    
        G_BestPos = GBPosition(TargetFoodIndex,:);
        G_BestCost = GBCost(TargetFoodIndex);
    
        Weight = rand(VarSize).^0.5;
        Velocity(i,:) = c1*Weight.*(P_BestPos(i,:)-Position(i,:)) + c2*(1-Weight).*(G_BestPos-Position(i,:));

        Velocity(i,:) = max(Velocity(i,:),VelMin);
        Velocity(i,:) = min(Velocity(i,:),VelMax);

        Position(i,:) = Position(i,:) + Velocity(i,:);

        IsOutside = (Position(i,:)<VarMin | Position(i,:)>VarMax);
        Velocity(i,IsOutside)=-Velocity(i,IsOutside);

        Position(i,:) = max(Position(i,:),VarMin);
        Position(i,:) = min(Position(i,:),VarMax);

        Cost(i) = CostFunction(Position(i,:));
    
        if Cost(i)<P_BestCost(i)
            stop(i) = 0;
            P_BestPos(i,:)=Position(i,:);
            P_BestCost(i)=Cost(i);
            historyVisitTable(i,:) = VisitTable(i,:);
            historyPosition(i,:) = Position(i,:);
            historyTarget(i) = TargetFoodIndex;
            stopR(i) = max(stopR(i)*0.95,50);
        elseif TargetFoodIndex~=historyTarget(i) || stop(i)>0
            stop(i) = stop(i) + 1;
            stopR(i) = stopR(i)*1.05;
        else
            stopR(i) = stopR(i)*1.05;
        end
    
        if Cost(i)<GBCost(TargetFoodIndex)
            GBCost(TargetFoodIndex)=Cost(i);
            GBPosition(TargetFoodIndex,:)=Position(i,:);
            VisitTable(:,TargetFoodIndex)=VisitTable(:,TargetFoodIndex)+0.21;
        end
    
        if mod(stop(i),round(stopR(i))) > stopR(i)-2
            VisitTable(i,:) = historyVisitTable(i,:);
            Position(i,:) = historyPosition(i,:);
        end
    end
    
    CheckFoodN = round(FinallyFoods+(nFoods-FinallyFoods)*(1-it/MaxIt));
    if ~(CheckFoodN==nFoods)
        [~,index] = max(GBCost);
        GBCost(index) = [];
        GBPosition(index,:) = [];
        VisitTable(:,index) = [];
        historyVisitTable(:,index) = [];
        nFoods = nFoods-1;
    end
    
    BestCost(it)=min(GBCost);

end

BestPosition     = G_BestPos;
BestScore        = G_BestCost;
ConvergenceCurve = BestCost;

end