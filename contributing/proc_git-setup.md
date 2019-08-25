# Using Git

This guide explains how to set up your system to connect to the proper git repositories.

`openshift/pipelines-docs` is a public GitHub repository that hosts the OpenShift Pipelines documentation.

* [Installing Git](#Installing-Git)
* [Configuring Git](#Configuring-Git)
* [Fork the upstream repository](#Fork-the-upstream-(GitHub)-repository)
* [Add your SSH keys](#Add-your-SSH-keys-to-GitHub)
* [Updating repository URLs](#Updating-repository-URLs)
* [Accessing unmerged commits](#Accessing-another-writer’s-unmerged-commits)
* [Additional resources](#Additional-resources)

----------------------------
### Installing Git

If using Fedora, open your terminal and enter the proper installation command.

#### Fedora
For installation use:

Up to Fedora 21
```
$ yum install git
```
Fedora 22 and later
```
$ dnf install git 
```

#### Other operating systems

* [Download Git](https://git-scm.com/downloads)


-----------------------------------------
### Configuring Git

Once you have Git installed, set up your Git account.

#### Procedure
1. Open **Terminal**
2. Set your name and email

```
$ git config --global user.name "<your-name>"
$ git config --global user.email "<your-email>"
```

> **TIP:** The email you specify should be the same one found in your [email settings](https://help.github.com/articles/adding-an-email-address-to-your-github-account/). To keep your email address hidden, see [Keeping your email address private](https://help.github.com/articles/keeping-your-email-address-private).

3. Set your Git defaults

```
$ git config --global pull.rebase true
$ git config --global push.default simple
```

-----------------------------------------
### Fork the upstream (GitHub) repository

Fork the `openshift/pipelines-docs` upstream repository to create a copy under your own GitHub ID. Clone your forked repository to bring your GitHub repository files to your local machine. Your forked repository is now the `origin` repository for your local files.

#### Procedure
1. Open a browser and navigate to the upstream repository located at https://github.com/openshift/pipelines-docs.git
2. Click **Fork** located in the upper right under your profile icon.
3. Select your user account for the location of the forked repository. This creates your own copy of the repository under your own GitHub ID.

> **NOTE:** For more information on [forking](https://help.github.com/articles/fork-a-repo/) and [cloning](https://help.github.com/articles/cloning-a-repository/), consult the official [documentation](https://help.github.com/).


-----------------------------------------
### Add your SSH keys to GitHub
If you choose to use the SSH address for your clones, you will need to add an SSH Key to GitHub first.

#### Procedure
1. Open the *Terminal*.
2. Check to see if you have a public SSH key:

````
$ ls ~/.ssh/
````
3. If you do not have a key, generate one:

```
$ ssh-keygen -t rsa -C "<your-email>"
```
4. Open your key in an editor:

```
$ cd ~/.ssh/
$ vi id_rsa.pub
```
5. Copy the contents of the file to your clipboard.
6. Visit [https://github.com/settings/keys](https://github.com/settings/keys)
7. Click **New SSH Key**.
8. Name your key and paste the contents of your key file.
9. Click **Add SSH Key**.


-----------------------------------------
### Updating repository URLs

If the upstream repository is moved, you can change the downstream URL by using the following command:

```
$ git remote set-url upstream https://github.com/<new upstream>
```

Use the following command any time you need to fetch the latest source code locally:

```
$ git fetch upstream
```


------------------------------------------
### Accessing another writer’s unmerged commits

This is the process you can use if you need commits another writer has submitted that is not yet merged.

1. Check out a new topic branch from upstream/master as you normally do.

```
$ git fetch upstream
$ git checkout -b <new-topic-branch> upstream/master
```

2. If you have not yet added that writer’s remote repository, add it now.

```
$ git remote add -f <user> git@github.com:<user>/strimzi-kafka-operator.git
```

3. Rebase to bring in the changes that are in that user’s outstanding
 `origin/<merge-request-branch>` branch.

```
$ git rebase <user>/<merge-request-branch>
```

---------------------------------------
### Additional resources

* [Official Git Site](https://git-scm.com)
* [GitHub Help](http://help.github.com)
