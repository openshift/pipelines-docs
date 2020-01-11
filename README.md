# Openshift Pipelines Documentation

Welcome to the source file repository for OpenShift Pipelines documentation.

OpenShift Pipelines is a cloud-native CI/CD solution built for Kubernetes and is based on the upstream Tekton project (previously known as Knative Build).
It complements the Jenkins images that are shipped with OpenShift (OCP).

The operator for OpenShift Pipelines is available in the OpenShift OperatorHub.
To try out OpenShift Pipelines, obtain an OCP cluster by visiting [cloud.redhat.com](https://cloud.redhat.com) or [rhpds.redhat.com](https://rhpds.redhat.com).


----------------------------------------


## View Published Documentation

View Pipelines documentation and walk-through tutorials on our documentation
[website](https://openshift.github.io/pipelines-docs/).


## Questions and Feedback

For questions and feedback please join the pipelines-interest@redhat.com mailing list. If you would like to contribute a fix or add new content to the documentation, you can submit an issue or pull request. Please see our [contributor guidelines](contributing/con_contributing-documentation.md) for information on how you can help.


## Resources

For more information on OpenShift Pipelines, please check out the following links:

* [OpenShift Pipelines Overview Presentation](https://docs.google.com/presentation/d/1E6FChdbIrMHlynF-yvEMrTiAnR8rwMdvebBxPgdcmrE/edit#slide=id.g547716335e_0_260)

* [OpenShift Pipelines Tutorial](https://github.com/openshift/pipelines-tutorial/)

* [Tekton Documentation](https://github.com/tektoncd/pipeline/tree/master/docs)

* [Tekton CLI Download](https://github.com/tektoncd/cli/tree/v0.1.2)

## Building Pipelines Documentation with Antora
1. [Setup Git with the correct configuration.](/contributing/proc_git-setup.md)
2. Clone this repository
3. Install [Antora](https://docs.antora.org)
4. Run **./docs-build.sh**

## Publishing New Documentation Version
1. Checkout to the last existing working documentation branch, for example **op-0.8-master**).
> git fetch --all && git checkout -B \<branch-name\>
2. Reset the branch to be in sync with **openshift/pipelines-docs**
> git reset --hard \<openshift-remote\> \<branch-name\>
3. Create a branch with a new version of the documentation, naming the branch **op-<version\>-master**
4. Edit the version on the line `version: <version>` in the `antora.yml` file.
5. Push the changes to your fork.
6. Checkout to **master** branch
7. Add the name of the branch with new version of the documentation in the `site.yml`, line `branches: [<branches>]`
8. Run `docs_build.sh`
9. Review the generated content in `./index.html`.
10. Submit a PR against **openshift/pipelines-docs** repository.