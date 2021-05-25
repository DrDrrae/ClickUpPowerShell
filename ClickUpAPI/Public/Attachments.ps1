<#
.SYNOPSIS
    Upload an attachment to a ClickUp task.
.DESCRIPTION
    Upload an attachment to a ClickUp task.
.EXAMPLE
    PS C:\> New-ClickUpTaskAttachment
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
    [CmdletBinding()]
    [OutputType([System.Management.Automation.PSCustomObject])]
    param(
        [Parameter(Mandatory = $true)]
        [string]$TaskID,
        [Parameter(Mandatory = $true)]
        [string]$AttachmentPath
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