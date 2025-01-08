# Artillery Load Testing

This project contains a load test script using Artillery to test API performance.

## Prerequisites

- **Node.js**: Install from [Node.js official site](https://nodejs.org/).
- **Artillery**: Install globally via npm:

### for run the script
  ```bash
  npm install -g artillery
  ```


### for view the requests result as json file
  ```bash
  chmod +x run_artillery_tests.sh

```
  ```bash
  ./run_artillery_tests.sh

```
### Docker build Command
```docker
docker build -t quay.io/zagaos/testcases-script-automate:<latest version>
```
### Navigate to the values.yaml file:
 - Go to the path deployment-manifests/testcases/values.yaml.

### Locate the Docker image configuration:
 - In values.yaml, find the section where the Docker image is specified. This might look like:

```yaml
 image:
  registry: quay.io
  username: zagaos
  name: testcases-script-automate
  pullPolicy: IfNotPresent
  tag: <latest-tag> # Update yor latest tag
  strategy: ""
```
### Helm install Command

```
  helm install automate-testcase deployment-manifests/testcases
```
### Helm upgrade Command

```
  helm upgrade automate-testcase deployment-manifests/testcases
```
