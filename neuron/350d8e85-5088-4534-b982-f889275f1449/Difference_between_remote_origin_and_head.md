---
tags: [git]
---

# Difference between _remote_, _origin_, _HEAD_

<dl>
<dt> remote
</dt>
<dd>
A remote is a git repository that is hosted on a server which you can interact with over a network. You can have more than one remote for a local repository.
</dd>

<dt>
origin
</dt>
<dd>
The default name given to the remote repository that was cloned. When you clone a repository, git automatically creates a default remote called `origin`. This is essentially an alias for the URL of this repository.
</dd>

<dt>HEAD</dt>
<dd>A reference to the most recent commit on the currently checked-out branch. It points to the tip of the branch which is the commit that was most recently added. If you have changes in your working directory that have yet to be committed, the HEAD will be behind them. Once you commit them, the HEAD will update to reflect the new commit.</dd>
</dl>
