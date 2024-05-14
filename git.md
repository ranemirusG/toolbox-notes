# Git


## List of changes
```
git log
git log -n <number_of_commits>
git log --format="%h %s" # abbreviated commit hash (%h) and the subject of the commit (%s)

```






## Previous versions
`git show [COMMIT HASH]`
`git show [COMMIT HASH]:[FILE NAME]`


If you want to temporarily go back to it, fool around, then come back to where you are, all you have to do is check out the desired commit:
`git checkout [COMMIT HASH]`

- <https://stackoverflow.com/questions/4114095/how-do-i-revert-a-git-repository-to-a-previous-commit>



## Signed commits
Ensure that code commits made by developers to a version control system are attributable and non-repudiable. This approach requires developers to use their private keys to sign each commit, linking their identity to the changes made in the code. The signature can then be verified using the corresponding public key, ensuring the commit's integrity and origin.

`git verify-commit`

`git verify-tag`













## Hooks
(This very repo has a hook to list all the `.md` files and update the content of the `README.md`!)

- <https://stackoverflow.com/questions/5235277/cross-platform-git-hooks>
- <https://stackoverflow.com/questions/26624368/handle-multiple-pre-commit-hooks>


