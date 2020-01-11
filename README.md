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
1. Clone this repository.
2. Install [Antora](https://docs.antora.org/antora/2.2/install/install-antora/)
3. Run **./docs-build.sh**

### Publishing new Versions
1. Checkout to last existing working documentation branch e.g. **op-0.8-master**).
> git fetch --all && git checkout -b 
2. Sync the branch with **openshift/pipelines-docs**
> git reset
> git fetch --all && git checkout -b 
2. Create a new branch 