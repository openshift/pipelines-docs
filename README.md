# Openshift Pipelines Documentation

## Visit https://openshift.github.io/pipelines-docs/index.html

Welcome to the source file repository for OpenShift Pipelines documentation.

OpenShift Pipelines is a cloud-native CI/CD solution built for Kubernetes and is based on the upstream Tekton project (previously known as Knative Build).
It complements the Jenkins images that are shipped with OpenShift (OCP).

The operator for OpenShift Pipelines is available in the OpenShift OperatorHub.
To try out OpenShift Pipelines, obtain an OCP cluster by visiting [cloud.redhat.com](https://cloud.redhat.com) or [rhpds.redhat.com](https://rhpds.redhat.com).


----------------------------------------


## Questions and Feedback

For questions and feedback please join the pipelines-interest@redhat.com mailing list. If you would like to contribute a fix or add new content to the documentation, you can submit an issue or pull request. Please see our [contributor guidelines](contributing/con_contributing-documentation.md) for information on how you can help.


## Resources

For more information on OpenShift Pipelines, please check out the following links:

* [OpenShift Pipelines Overview Presentation](https://docs.google.com/presentation/d/1E6FChdbIrMHlynF-yvEMrTiAnR8rwMdvebBxPgdcmrE/edit#slide=id.g547716335e_0_260)

* [OpenShift Pipelines Tutorial](https://github.com/openshift/pipelines-tutorial/)

* [Tekton Documentation](https://github.com/tektoncd/pipeline/tree/master/docs)

* [Tekton CLI Download](https://github.com/tektoncd/cli/tree/v0.1.2)


# <a name="updating"></a>Contributing to the OpenShift Pipelines documentation

## <a name="prereqs_antora"></a>Prerequisites
1. Clone this repository.
1. Checkout to **master** branch.
1. Install [Antora](https://docs.antora.org).
1. Install [AsciiDoctor](https://asciidoctor.org/).
1. Use [AsciiDoc](https://asciidoctor.org/docs/asciidoc-syntax-quick-reference/).

## <a name="existing_docs"></a> Updating existing documentation
1. Checkout the branch with the product version you want to update (**op-<version\>-master**).
1. Reset the branch to be in sync with **openshift/pipelines-docs**
```
git reset --hard <openshift/pipelines-docs-remote> op-<version>-master
```
3. Checkout to a new feature branch with a name relevant to the update you want to make (**update links**)
3. Make changes to the documentation. (If you want to add a new document, [follow these steps](#new_doc).)
4. [Preview the documentation on the branch.](#preview_on_branch)
5. Push the changes to your fork.
6. Submit a PR against **openshift/pipelines-docs/<branch-name\>**
7. After PR is merged, [Render and publish the documentation set in the master branch](#full_render).

## <a name="existing_docs"></a> Creating documentation for a new version of OpenShift Pipelines
1. Checkout to the last existing working documentation branch, for example **op-0.8-master**).
> git fetch --all && git checkout -B \<branch-name\>
2. Reset the branch to be in sync with **openshift/pipelines-docs**
> git reset --hard \<openshift/pipelines-docs-remote\> \<branch-name\>
3. Create a branch with a new version of the documentation, naming the branch **op-<version\>-master**
> git checkout -B **op-<version\>-master**
4. Continue from Step 3 in [Updating existing documentation](#existing_docs).



## <a name="preview_on_branch"></a> Previewing the documentation locally.
1. Checkout to a branch with source files for the documentation you want to preview (**op-<version\>-master**).
1. Change to the repository's root directory.
1. Run:
> antora local_site.yml && <your_favourite_browser> index.html

### <a name="new_doc"></a> Adding a new document to the repository
1. Add the module to the latest version of the documentation (product) in the directory **/modules/ROOT/pages**. Use [AsciiDoc](https://asciidoctor.org/).
2. Add the module to the **/modules/ROOT/nav.adoc** in the following format. Asterisks (**\***) represent the heading level.
> xref:<module_filename.adoc\>[<heading_number\> <heading\>]





## Submitting new documentation
1. Checkout to the last existing working documentation branch, for example **op-0.8-master**).
> git fetch --all && git checkout -B \<branch-name\>
2. Reset the branch to be in sync with **openshift/pipelines-docs**
> git reset --hard \<openshift/pipelines-docs-remote\> \<branch-name\>
3. Create a branch with a new version of the documentation, naming the branch **op-<version\>-master**
> git checkout -b **op-<version\>-master**
4. Edit the version on the line `version: <version>` in the `antora.yml` file.
5. Push the changes to your fork.

##  <a name="full_render"></a> Rendering the OpenShift Pipelines documentation set

1. Checkout to **master** branch
> :warning: If adding a documentation for an unpublished version: Add the name of the branch containing the new version of the documentation into the `site.yml`, line `branches: [<branches>]`
1. Run `docs_build.sh`
1. Review the generated content in `./index.html`.
1. Submit a PR against **openshift/pipelines-docs** repository.