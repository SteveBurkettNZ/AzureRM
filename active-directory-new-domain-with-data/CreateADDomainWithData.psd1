@{ 
    AllNodes = @( 
        @{ 
            Nodename = 'localhost'
            PSDscAllowDomainUser = $true
        }
    )

    NonNodeData = @{
   
UserData = @'
UserName,Password,Dept,Title
Alice,P@ssw0rd,Accounting,Manager
Bob,P@ssw0rd,IT,Manager
Charlie,P@ssw0rd,Marketing,Manager
Debbie,P@ssw0rd,Operations,Manager
Eddie,P@ssw0rd,Accounting,Specialist
Frieda,P@ssw0rd,IT,Specialist
George,P@ssw0rd,Marketing,Specialist
Harriet,P@ssw0rd,Operations,Specialist
'@


        RootOUs = 'AdventureWorksCycles'
        ChildOUs = 'Users','Computers','Groups','Servers','Service Accounts'
        UsersOUs = 'Cloud Users','Non-Cloud Users'
        GroupsOUs = 'Cloud Security Groups','Non-Cloud Security Groups'
        TestObjCount = 5
        LabCount = 6

    }
} 

