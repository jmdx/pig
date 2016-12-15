# pig
Powershell Interface for Git

This is currently a very early work-in-progress.  The primary goal is to translate `git ... --porcelain` commands into a powershell-friendly format, eventually enabling usages such as:

```powershell
pig status | where { $_.HasMergeConflict }
```
or
```powershell
pig log | where { $_.LinesAdded -gt 1000 }
```

In cases where pig lacks a translation of a given git command, it will just fall-through back to git for convenience.
