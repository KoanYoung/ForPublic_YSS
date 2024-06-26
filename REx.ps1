Function Restart-Explorer {
    [CmdletBinding(SupportsShouldProcess)]
    [Outputtype("None")]
    Param()

    Write-Verbose "[$((Get-Date).ToString()) BEGIN] $($MyInvocation.MyCommand) 로 새로 Refresh 합니다. "
    
    Get-Process -Name Explorer | Stop-Process -Force
    Start-Sleep -Seconds 2
    Try {
        Write-Verbose "[$((Get-Date).ToString()) BEGIN] 정상 재시작됐는지 확인합니다."
		Get-Process -Name Explorer -ErrorAction stop
    }
    Catch {
        Write-Warning "정상 재시작되지 않아 다시 실행시킵니다."
        Try { Start-Process explorer.exe }
        Catch { Throw $_ }
    }
    Write-Verbose "[$((Get-Date).ToString()) END] $($MyInvocation.MyCommand) 명령이 끝났습니다."
}
Restart-Explorer -Verbose