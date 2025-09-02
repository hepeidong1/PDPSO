function [BestPosition,BestScore,ConvergenceCurve] = PSO(VarMin,VarMax,nVar,nPop,MaxIt,CostFunction)

VarSize=[1 nVar];
c1=2.0;
c2=2.0;

VelMax=0.1*(VarMax-VarMin);
VelMin=-VelMax;
empty_particle.Position=[];
empty_particle.Cost=[];
empty_particle.Velocity=[];
empty_particle.Best.Position=[];
empty_particle.Best.Cost=[];

particle=repmat(empty_particle,nPop,1);
GlobalBest.Cost=inf;
for i=1:nPop
    particle(i).Position=unifrnd(VarMin,VarMax,VarSize);
    particle(i).Velocity=zeros(VarSize);
    particle(i).Cost=CostFunction(particle(i).Position);
    particle(i).Best.Position=particle(i).Position;
    particle(i).Best.Cost=particle(i).Cost;
    if particle(i).Best.Cost < GlobalBest.Cost
        GlobalBest=particle(i).Best;
    end
end

BestCost=zeros(1,MaxIt);
for it=1:MaxIt
    w = 0.4 + 0.5*(it/MaxIt);
    for i=1:nPop 
        particle(i).Velocity = w*particle(i).Velocity ...
            +c1*rand(VarSize).*(particle(i).Best.Position-particle(i).Position) ...
            +c2*rand(VarSize).*(GlobalBest.Position-particle(i).Position);
        
        particle(i).Velocity = max(particle(i).Velocity,VelMin);
        particle(i).Velocity = min(particle(i).Velocity,VelMax);
        
        particle(i).Position = particle(i).Position + particle(i).Velocity;
        IsOutside = (particle(i).Position<VarMin | particle(i).Position>VarMax);
        particle(i).Velocity(IsOutside)=-particle(i).Velocity(IsOutside);
        particle(i).Position = max(particle(i).Position,VarMin);
        particle(i).Position = min(particle(i).Position,VarMax);
        
        particle(i).Cost = CostFunction(particle(i).Position);
        if particle(i).Cost<particle(i).Best.Cost
            particle(i).Best.Position=particle(i).Position;
            particle(i).Best.Cost=particle(i).Cost; 
        end
        if particle(i).Best.Cost<GlobalBest.Cost
                GlobalBest=particle(i).Best;
        end 
    end
    BestCost(it)=GlobalBest.Cost;
end

BestPosition     = GlobalBest.Position;
BestScore        = GlobalBest.Cost;
ConvergenceCurve = BestCost;
end

