# Contributing to OpenShift Pipelines Documentation

* [Before You Begin](#Before-You-Begin)
* [General Information](#General-Information)
* [Raising an Issue](#Raising-an-Issue)
* [Put in a Pull Request](#Put-in-a-Pull-Request)
* [Updating Documentation](#Updating-Documentation)
* [Code of Conduct](#Code-of-Conduct)

-----------------------------

**You can contribute by:**
- Raising an issue you find in the documentation
- Fixing issues by opening a pull request
- Improving documentation or code samples

All bugs, tasks or enhancements are tracked as [GitHub issues](https://github.com/openshift/pipelines-docs/issues). Use labels to indicate requirements and information related to the reported issue.

## Before You Begin

* [Get started](/contributing/proc_git-setup.md) by installing and getting familiar with [Git](https://git-scm.com/doc).
* Use [AsciiDoc](https://asciidoctor.org/docs/asciidoc-syntax-quick-reference/) to contribute documentation to the repository. For details see the Updating Documentation section below.
* Refer to our [style guide](/contributing/ref_documentation-styling.md) for guidance on formatting your documentation contributions.

## General Information

Thank you for your contributions! Please follow this process to submit a patch:

1. Create an issue describing your proposed change to the repository.

1. The repository owners will triage and respond to your issue promptly.

1. Fork the repository and create a topic branch.

1. Submit a pull request with the proposed changes. The required format for the Git commit message is "Issue #<issue_message>".


## Raising an Issue

GitHub issues can be used to report bugs or submit feature requests.

When reporting an issue, you can use the [applicable issue reporting template](https://github.com/openshift/pipelines-docs/issues/new/choose). Please include the following information:

* The version of the project you are using (version number, git commit, etc.)
* Operating system you are using
* The exact, minimal, steps needed to reproduce the issue.


## Put in a Pull Request

Make a pull request (PR) to add content to the repository. When making a PR, ensure you include:

* A description of what the PR fixes
* Associated issue# and issue title (if applicable)
* The version of the project you are using (version number, git commit, etc.)
* Operating system you are using

See [here](/contributing/proc_git-setup.md) for more information on using Git and making pull requests.

## Updating Documentation
The source documentation files are located in the version branches in the `pipelines-docs/modules/ROOT/pages/` directory. To access them, checkout the op-<version>-master, for example op-0.8-master, and navigate to the pipelines-docs/modules/ROOT/pages/ directory.

This repository uses Antora to publish the documentation and we use asciidoc markup language.

The documentation follows the [modular documentation guidelines](https://redhat-documentation.github.io/modular-docs/#introduction).

There are four types of content:
* proc: Files appended with proc are Procedural modules
* con: Files appended with con are concept modules
* ref: Files appended with ref are reference modules
* Assembly: Files appended with assembly are master docs for a particular section. They are a collection of the modules in a section, and contain a list of `include files` that are a part of that assembly/section.

The `index.adoc` file is the first landing page in the rendered version of the documentation.

The following sections describe how you can update existing content, verify, and publish your documentation. It also covers instructions on creating new Version branches.

### <a name="updating"></a>Modifying existing documentation

### Prerequisites
You must:
* Fork and clone this repository.
* Install [Antora](https://docs.antora.org).
* Install [AsciiDoctor](https://asciidoctor.org/).
* Use [AsciiDoc](https://asciidoctor.org/docs/asciidoc-syntax-quick-reference/).

### Procedure
To update existing documentation:

1.   Checkout the product version branch you want to update, for example:

     ```
     git checkout op-<version>-master
     ```
1.   Ensure that your forked repository is in sync with the **openshift/pipelines-docs** repository:

      ```
      git fetch <openshift/pipelines-docs-remote> && git reset --hard <openshift/pipelines-docs-remote>/op-<version>-master
      ```
1.    Checkout a new feature branch with a name relevant to the update you want to make, for example:

       ```
       git checkout -b update_links
       ```
1.   Make changes to the documentation.

1. To add a new module to the repository, add the module to the `/modules/ROOT/nav.adoc` file in the following format:
`* xref:<module_filename.adoc>[<heading_number> <heading>]`.
 The number of asterisks (*) represents the heading level.

1. [Preview the documentation on the branch.](#preview_on_branch)
1. Push the changes to your fork's feature branch.
1. Submit a PR against `openshift/pipelines-docs/<branch-name>`.
1. After the PR is merged, [render and publish the documentation set in the master branch](#full_render).

## <a name="preview_on_branch"></a> Previewing the rendered documentation.
1.   Checkout to a branch with source files for the documentation you want to preview, for example,`op-<version>-master`.
1.   Change to the repository's root directory and run:

       ```
       antora local_site.yml && <your_favourite_browser> build/site/index.html
       ```

##  <a name="full_render"></a> Rendering and publishing the OpenShift Pipelines documentation set

1. Checkout to the **master** branch

    :warning: If you created documentation for an unpublished version, in the `site.yml` file:
    1. On the line `branches: [<branches>]`, add the name of the branch containing the new version of the documentation.
    1. Edit the `<version>` in the `start_page: <version>@docs::index.adoc` to the latest version number.

1. Run the `docs_build.sh` script.
1. Review the generated content in `./index.html`.
1. Submit a PR against **openshift/pipelines-docs** repository.


## <a name="existing_docs"></a> Creating documentation for a new version of OpenShift Pipelines


To create a new Version branch and publish it with updated documentation using the CLI:

1.   In the fork, checkout to the branch with the documentation for the last version of OpenShift Pipelines, for example, for `op-0.8-master`, run:

      ```
      git fetch --all && git checkout op-0.8-master
      ```
1.   Reset the branch to be in sync with the `openshift/pipelines-docs` repository.

      ```
      git reset --hard <openshift/pipelines-docs-remote>/op-<version>-master
      ```
1.   Create a new Version branch for the new version of the documentation, naming the branch in the following format: `op-<version\>-master`.

      ```
      git checkout -B op-<version>-master
      ```
1.   In the new version branch, edit the `version` in `antora.yml` file. This file is specific to each branch and is not present in the Master.
1. Push the changes to your fork and submit a PR to create an equivalent branch in the `openshift/pipelines-docs` repository.
1. To [verify that the new version of the documentation renders properly and publish](#full_render). Ensure that you update the `site.yml` in the `master` branch as described in the steps.
1. To modify the documentation continue from Step 3 in the [Modifying  existing documentation](#existing_docs).

To create a branch using the GUI:
1. Select the latest version branch on which you want to base the new version from the **Branch** drop down on the top-left.

   **Note**: Do not base your new version branch on the Master. Master does not have the Modules/Root folder that gives you access to the root docs.
1. Click the **Branch** drop down and type the name of the new version branch you want to create in the **Find or Create a branch** field, and click **Create branch:<New version branch> to create the branch. This automatically creates a **Compare & Pull Request**, ignore it.


## Code of Conduct

Examples of behavior that contributes to creating a positive environment include:

* Using welcoming and inclusive language
* Focusing on what is best for the community
* Being respectful of differing viewpoints and experiences
* Gracefully accepting constructive criticism

This Code of Conduct is adapted from the [Contributor Covenant](http://contributor-covenant.org/version/1/4).
