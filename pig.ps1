param(
  [string]$GitCommand = "status"
)

switch($GitCommand) {
  "status" {
    # TODO add some plain english Write-Host calls here
    git status --porcelain $args | foreach {
      # The porcelain is guaranteed to be in the "XY PATH1 -> PATH2"
      # TODO translate the meaning of X, Y according to the merged/unmerged
      # cases listed in the man page
      # TODO prevent weird filenames from messing this up
      $pathParts = $_.Split(" -> ");
      $lhs = $pathParts[0];
      $newGitPath = $pathParts[1];
      New-Object PSObject -Property @{
        X = $lhs[0]
        Y = $lhs[1]
        OldPath = $lhs.Substring(3)
        NewPath = $pathParts[1]
      } | Write-Output
    }
  }
  default {
    git $GitCommand $args
  }
}
