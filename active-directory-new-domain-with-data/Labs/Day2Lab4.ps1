# Set Company Logo
Set-ADFSWebTheme -TargetName default -Logo @{path="C:\Branding\CompanyLogo.png"}
# Set Company Illustration
Set-ADFSWebTheme -TargetName default -Illustration @{path="C:\Branding\CompanyIllustation.png"}
# Set Sign-In Page Description Text
Set-ADFSGlobalWebContent -SignInPageDescriptionText "<p> Please sign-in to CompanyName. </p>"
