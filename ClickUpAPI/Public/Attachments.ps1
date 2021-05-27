<#
.SYNOPSIS
    Upload an attachment to a ClickUp task.
.DESCRIPTION
    Upload an attachment to a ClickUp task.
.PARAMETER TaskID
    The ClickUp task ID. Could also be a custom ID with the -CustomTaskIDs and -TeamID parameters provided.
.PARAMETER AttachmentPath
    The path to the attachment to upload.
.PARAMETER CustomTaskIDs
    Set to $true if the task ID provided is a custom ID.
.PARAMETER TeamID
    Required ClickUp team ID if -CustomTaskIDs is set to $true.
.EXAMPLE
    PS C:\> New-ClickUpTaskAttachment -TaskID 9hv -AttachmentPath "C:\Path\To\File.txt"
    Upload file "File.txt" as an attachment to ClickUp task with ID "9hv".
.EXAMPLE
    PS C:\> New-ClickUpTaskAttachment -TaskID CustomTaskID -AttachmentPath "C:\Path\To\File.txt" -CustomTaskIDs $true -TeamID 123
    Upload file "File.txt" as an attachment to ClickUp task with custom ID "CustomTaskID".
.INPUTS
    None
.OUTPUTS
    System.Management.Automation.PSCustomObject.
.NOTES
    See the link for information.
.LINK
    https://jsapi.apiary.io/apis/clickup20/reference/0/attachments/create-task-attachment.html
#>
function New-ClickUpTaskAttachment {
    [CmdletBinding(DefaultParameterSetName = 'TaskID')]
    [OutputType([System.Management.Automation.PSCustomObject])]
    param(
        [Parameter(Mandatory = $true, ParameterSetName = 'TaskIDs', HelpMessage = 'The ClickUp TaskID.')]
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs', HelpMessage = 'The ClickUp custom TaskID.')]
        [string]$TaskID,
        [Parameter(Mandatory = $true, ParameterSetName = 'TaskIDs', HelpMessage = 'The path to the attachment to upload.')]
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs', HelpMessage = 'The path to the attachment to upload.')]
        [string]$AttachmentPath,
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs')]
        [bool]$CustomTaskIDs,
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs')]
        [UInt32]$TeamID
    )

    $FileBytes = [System.IO.File]::ReadAllBytes($AttachmentPath);
    $FileName = $AttachmentPath | Split-Path -Leaf
    $FileEnc = [System.Text.Encoding]::GetEncoding('ISO-8859-1').GetString($FileBytes);
    $Boundary = [System.Guid]::NewGuid().ToString();
    $LF = "`r`n";

    $Body = (
        "--$Boundary",
        "Content-Disposition: form-data; name=`"attachment`"; filename=`"$FileName`"",
        "Content-Type: application/octet-stream$LF",
        $FileEnc,
        "--$Boundary--$LF",
        "Content-Disposition: form-data; name=`"filename`"",
        $FileName,
        "--$Boundary--$LF"
    ) -join $LF

    Invoke-ClickUpAPIPostAttachment -Endpoint "task/$TaskID/attachment" -Body $Body -Boundary $Boundary
}