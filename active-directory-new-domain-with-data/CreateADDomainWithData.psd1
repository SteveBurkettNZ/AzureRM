﻿@{ 
    AllNodes = @( 
        @{ 
            Nodename = 'localhost'
            PSDscAllowDomainUser = $true
        }
    )

    NonNodeData = @{

        UserData = @'
Name,City,Country,Department,Displayname,EmailAddress,Fax,FirstName,LastName,MobilePhone,Office,PasswordNeverExpires,PhoneNumber,PostalCode,SignInName,State,StreetAddress,Title,UserPrincipalName
AlexD,San Diego,United States,Sales & Marketing,Alex Darrow,AlexD@emsforcsp.com,,Alex,Darrow,,131/1104,TRUE,+1 858 555 0110,92121,AlexD@emsforcsp.com,CA,9256 Towne Center Dr,Marketing Assistant,AlexD@emsforcsp.com
AllieB,Bellevue,United States,Finance,Allie Bellew,AllieB@emsforcsp.com,,Allie,Bellew,,18/2107,TRUE,+1 425 555 0105,98004,AllieB@emsforcsp.com,WA,205 108th Ave. NE,Administrative Assistant,AllieB@emsforcsp.com
AnneW,Louisville,United States,Executive Management,Anne Wallace,AnneW@emsforcsp.com,,Anne,Wallace,,15/1102,TRUE,+1 502 555 0144,40223,AnneW@emsforcsp.com,KY,9900 Corporate Campus Dr,President,AnneW@emsforcsp.com
AzizH,Cairo,Egypt,Finance,Aziz Hassouneh,AzizH@emsforcsp.com,,Aziz,Hassouneh,,98/2202,TRUE,+20 255501070,,AzizH@emsforcsp.com,,Smart Village Cairo/Alex Desert Road,Accountant II,AzizH@emsforcsp.com
BelindaN,Charlotte,United States,Legal,Belinda Newman,BelindaN@emsforcsp.com,,Belinda,Newman,,20/1109,TRUE,+1 980 555 0101,28273,BelindaN@emsforcsp.com,NC,8055 Microsoft Way,Paralegal,BelindaN@emsforcsp.com
BonnieK,San Diego,United States,Sales & Marketing,Bonnie Kearney,BonnieK@emsforcsp.com,,Bonnie,Kearney,,131/2105,TRUE,+1 858 555 0111,92121,BonnieK@emsforcsp.com,CA,9257 Towne Center Dr.,Sr. VP Sales & Marketing,BonnieK@emsforcsp.com
Brian Johnson (TAILSPIN),,,,Brian Johnson (TAILSPIN),BrianJ@emsforcsp.com,,Brian,Johnson,,,FALSE,,,BrianJ@emsforcsp.com,,,,BrianJ@emsforcsp.com
DavidL,Waukesha,United States,Operations,David Longmuir,DavidL@emsforcsp.com,,David,Longmuir,,24/1106,TRUE,+1 262 555 0106,53188,DavidL@emsforcsp.com,WI,N19 W24133 Riverwood Dr.,Corporate Security Officer,DavidL@emsforcsp.com
DenisD,Birmingham,United States,Legal,Denis Dehenne,DenisD@emsforcsp.com,,Denis,Dehenne,,23/3104,TRUE,+1 205 555 0106,35243,DenisD@emsforcsp.com,AL,3535 Gradview Parkway Suite 335,Paralegal,DenisD@emsforcsp.com
DorenaP,Louisville,United States,Engineering,Dorena Paschke,DorenaP@emsforcsp.com,,Dorena,Paschke,,23/2102,TRUE,+1 502 555 0102,40223,DorenaP@emsforcsp.com,KY,9900 Corporate Campus Dr.,CVP Engineering,DorenaP@emsforcsp.com
FabriceC,Birmingham,United States,Legal,Fabrice Canel,FabriceC@emsforcsp.com,,Fabrice,Canel,,14/1102,TRUE,+1 205 555 0103,35243,FabriceC@emsforcsp.com,AL,3535 Gradview Parkway Suite 335,Attorney,FabriceC@emsforcsp.com
GarretV,Seattle,United States,Operations,Garret Vargas,GarretV@emsforcsp.com,,Garret,Vargas,,36/2121,TRUE,+1 206 555 0105,98109,GarretV@emsforcsp.com,WA,320 Westlake Ave N. Thomas St.,CVP Operations,GarretV@emsforcsp.com
GarthF,Tulsa,United States,Sales & Marketing,Garth Fort,GarthF@emsforcsp.com,,Garth,Fort,,20/1101,TRUE,+1 918 555 0101,74133,GarthF@emsforcsp.com,OK,7633 E. 63rd Place,Web Marketing Manager,GarthF@emsforcsp.com
JanetS,Bellevue,United States,Sales & Marketing,Janet Schorr,JanetS@emsforcsp.com,,Janet,Schorr,,18/2111,TRUE,+1 425 555 0109,98004,JanetS@emsforcsp.com,WA,205 108th Ave. NE,Product Marketing Manager,JanetS@emsforcsp.com
JulianI,Bloomington,United States,Legal,Julian Isla,JulianI@emsforcsp.com,,Julian,Isla,,19/2106,TRUE,+1 309 555 0101,61704,JulianI@emsforcsp.com,IL,2203 E. Empire St.,Director,JulianI@emsforcsp.com
JunminH,Overland Park,United States,Research & Development,Junmin Hao,JunminH@emsforcsp.com,,Junmin,Hao,,23/3101,TRUE,+1 913 555 0101,66210,JunminH@emsforcsp.com,KS,10801 Mastin Blvd.,CVP Research & Development,JunminH@emsforcsp.com
KariF,Tokyo,Japan,Finance,Kari Furse,KariF@emsforcsp.com,,Kari,Furse,,97/2302,TRUE,+81 345550115,108-0080,KariF@emsforcsp.com,,Shinagawa Grand Central Tower 2-16-3 Konan Minato-ku,Budget Analyst,KariF@emsforcsp.com
KatieJ,Pittsburgh,United States,Finance,Katie Jordan,KatieJ@emsforcsp.com,,Katie,Jordan,,12/1110,TRUE,+1 412 555 0109,15212,KatieJ@emsforcsp.com,PA,30 Isabella St.,Auditor,KatieJ@emsforcsp.com
MollyD,Tulsa,United States,Sales & Marketing,Molly Dempsey,MollyD@emsforcsp.com,,Molly,Dempsey,,20/1104,TRUE,+1 918 555 0104,74133,MollyD@emsforcsp.com,OK,7633 E. 63rd Place,Product Manager,MollyD@emsforcsp.com
PavelB,Iselin,United States,Sales & Marketing,Pavel Bansky,PavelB@emsforcsp.com,,Pavel,Bansky,,19/3123,TRUE,+1 732 555 0102,8830,PavelB@emsforcsp.com,NJ,101 Wood Avenue South,VP Sales,PavelB@emsforcsp.com
RobY,Bloomington,United States,Legal,Rob Young,RobY@emsforcsp.com,,Rob,Young,,19/2109,TRUE,+1 309 555 0104,61704,RobY@emsforcsp.com,IL,2203 E. Empire St.,CVP Legal,RobY@emsforcsp.com
RobinC,Fort Lauderdale,United States,Sales & Marketing,Robin Counts,RobinC@emsforcsp.com,,Robin,Counts,,18/1106,TRUE,+1 954 555 0118,33309,RobinC@emsforcsp.com,FL,6750 North Andrews Ave.,Marketing Assistant,RobinC@emsforcsp.com
SaraD,Tulsa,United States,Sales & Marketing,Sara Davis,SaraD@emsforcsp.com,,Sara,Davis,,20/2107,TRUE,+1 918 555 0107,74133,SaraD@emsforcsp.com,OK,7633 E. 63rd Place,Product Manager,SaraD@emsforcsp.com
TonyK,Birmingham,United States,Finance,Tony Krijnen,TonyK@emsforcsp.com,,Tony,Krijnen,,14/1108,TRUE,+1 205 555 0108,35243,TonyK@emsforcsp.com,AL,3535 Gradview Parkway Suite 335,CVP Finance,TonyK@emsforcsp.com
ZrinkaM,San Diego,United States,Sales & Marketing,Zrinka Makovac,ZrinkaM@emsforcsp.com,,Zrinka,Makovac,,131/2103,TRUE,+1 858 555 0109,92121,ZrinkaM@emsforcsp.com,CA,9255 Towne Center Dr.,VP Marketing,ZrinkaM@emsforcsp.com
'@
<#
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
#>

        RootOUs = 'AlpineSkiHouse'
        ChildOUs = 'Users','Computers','Groups','Servers','Service Accounts'
        UsersOUs = 'Cloud Users','Non-Cloud Users'
        GroupsOUs = 'Cloud Security Groups','Non-Cloud Security Groups'
        TestObjCount = 5
        LabCount = 6

    }
} 

