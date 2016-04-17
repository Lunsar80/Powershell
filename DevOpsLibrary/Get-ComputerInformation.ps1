Function Get-ComputerInformation
{
    PARAM ($ComputerName)
    # Computer System
    $ComputerSystem = Get-WmiObject -Class Win32_ComputerSystem
    # Operating System
    $OperatingSystem = Get-WmiObject -Class Win32_OperatingSystem
    # BIOS
    $BIOS = Get-WmiObject -Class Win32_BIOS

    # Prepare Output
    $Properties = @{
    ComputerName = $ComputerName
    Manufacturer = $ComputerSystem.Manufacturer
    Model = $ComputerName.Model
    OperatingSystem = $OperatingSystem.Caption
    OperatingSystemVersion = $OperatingSystem.Version
    SerialNumber = $BIOS.SerialNumber
    }

    # Output INformation
    New-Object -TypeName PSobject -Property $Properties
    }