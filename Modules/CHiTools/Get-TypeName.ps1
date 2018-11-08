#region Get-TypeName

<#
.SYNOPSIS
    Get the TypeName(s) of the object.
.DESCRIPTION
    Get-Member shows the TypeName(s) of an object(s). If you are only looking the TypeName, you scroll often and you not will
    notice then has more types.
    Get-TypeName will return only the unique TypeNames.
.EXAMPLE
    PS> Get-ChildItem -Path 'C:\' -Force | Get-TypeName
    ---
    System.IO.DirectoryInfo
    System.IO.FileInfo

.INPUTS
    Inputs to this cmdlet (if any)
.OUTPUTS
    [String[]]
.NOTES
    Version 1.00 (2018-11-07, Kees Hiemstra)
    - Initial version.
.COMPONENT

.ROLE

.FUNCTIONALITY

.LINK

.LINK

#>
function Get-TypeName
{
    [CmdletBinding(DefaultParameterSetName='Parameter Set 1', 
                   PositionalBinding=$false,
                   ConfirmImpact='Low')]
    [Alias('GT')]
    [OutputType([String[]])]
    Param
    (
        # Param1 help description
        [Parameter(Mandatory=$false, 
                   ValueFromPipeline=$true,
                   ValueFromPipelineByPropertyName=$true, 
                   ValueFromRemainingArguments=$true, 
                   Position=0,
                   ParameterSetName='Parameter Set 1')]
        $InputObject
    )

    Begin
    {
        $Result = [string[]]@()
    }
    Process
    {
        if ($InputObject -ne $null)
        {
            $TypeName = ($InputObject | Get-Member).TypeName[0]
        }
        else
        {
            $TypeName = '<null>'
        }

        if ($TypeName -notin $Result)
        {
            $Result += $TypeName
        }
    }
    End
    {
        Write-Output $Result
    }
}

#endregion


