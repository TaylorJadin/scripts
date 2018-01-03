Sets IE as the default Browser
Sets Adobe Reader as the Default PDF

Before Rebooting to Image (More like what Johan did)
Dism.exe /Image:%OSDisk%\ /Import-DefaultAppAssociations:DefaultAppAssoc\Win10DefaultAppAssoc.xml

Info taken from: http://deploymentresearch.com/Research/Post/507/Setting-Internet-Explorer-as-your-default-browser-in-Windows-10-during-OS-Deployment


After Booting into WIndows: (How it's currently configured in our OSD TS)
Dism.exe /online /Import-DefaultAppAssociations:DefaultAppAssoc\Win10DefaultAppAssoc.xml