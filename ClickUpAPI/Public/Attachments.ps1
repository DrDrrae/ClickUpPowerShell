<#
.SYNOPSIS
    Uploads an attachment to a specified ClickUp task.

.DESCRIPTION
    The New-ClickUpTaskAttachment cmdlet uploads a file as an attachment to a ClickUp task.
    You can specify the task by its ID or by using custom task IDs (requires Team ID).

.PARAMETER TaskID
    The ID of the task to upload the attachment to.
    This parameter is mandatory when not using Custom Task IDs.

.PARAMETER AttachmentPath
    The local file path of the attachment to be uploaded.
    This parameter is mandatory.

.PARAMETER CustomTaskIDs
    Indicates that the provided TaskID is a custom task ID.
    If set to $true, the TeamID parameter is also required.

.PARAMETER TeamID
    The ID of the team (workspace) where the custom task ID exists.
    This parameter is mandatory when CustomTaskIDs is set to $true.

.EXAMPLE
    New-ClickUpTaskAttachment -TaskID "8675309" -AttachmentPath "C:\Reports\Status.pdf"

    Uploads the file "Status.pdf" to the task with ID "8675309".

.EXAMPLE
    New-ClickUpTaskAttachment -TaskID "CUST-123" -AttachmentPath "C:\Images\Design.png" -CustomTaskIDs $true -TeamID 123456

    Uploads the file "Design.png" to the task with custom ID "CUST-123" in team 123456.

.INPUTS
    None. You cannot pipe objects to this cmdlet.

.OUTPUTS
    System.Management.Automation.PSCustomObject. Returns the response from the ClickUp API containing attachment details.

.NOTES
    API Reference: https://developer.clickup.com/reference/createtaskattachment

.LINK
    https://developer.clickup.com/reference/createtaskattachment
#>
function New-ClickUpTaskAttachment {
    [CmdletBinding(DefaultParameterSetName = 'TaskID')]
    [OutputType([System.Management.Automation.PSCustomObject])]
    param(
        [Parameter(Mandatory = $true, ParameterSetName = 'TaskID')]
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs')]
        [string]$TaskID,
        [Parameter(Mandatory = $true, ParameterSetName = 'TaskID')]
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs')]
        [string]$AttachmentPath,
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs')]
        [bool]$CustomTaskIDs,
        [Parameter(Mandatory = $true, ParameterSetName = 'CustomTaskIDs')]
        [UInt64]$TeamID
    )

    $FileBytes = [System.IO.File]::ReadAllBytes($AttachmentPath)
    $FileName = $AttachmentPath | Split-Path -Leaf
    $FileEnc = [System.Text.Encoding]::GetEncoding('ISO-8859-1').GetString($FileBytes)
    $Boundary = [System.Guid]::NewGuid().ToString()
    $LF = "`r`n"

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

    if ($PSBoundParameters.ContainsKey('CustomTaskIDs')) {
        $QueryString = @{
            custom_task_ids = $CustomTaskIDs
            team_id         = $TeamID
        }
    } else {
        $QueryString = @{}
    }

    Invoke-ClickUpAPIPostAttachment -Arguments $QueryString -Endpoint "task/$TaskID/attachment" -Body $Body -Boundary $Boundary
}