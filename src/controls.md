# Security controls

Behind the scenes Lava uses other security tools and custom security
checks to perform a security scan. Tools are integrated through what is called
["checktypes"](helpdoc/checktypes.md).

Checktypes are part of the Vulcan ecosystem and both Vulcan and Lava share the
same collection located at <https://github.com/adevinta/vulcan-checks>.

## Type of security controls

The following table lists all the security controls covered by Lava's
checktype collection.

| Security Control   | Description                                                                                                                                                       |
|--------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| SAST               | Static Application Security Testing. It's the analysis of source code.                                                                                            |
| SCA                | Software Composition Analysis. For instance, detection of outdated dependencies.                                                                                  |
| IaC security       | Static analysis of Infrastructure as Code manifests. For instance, AWS CloudFormation templates or Terraform configurations.                                      |
| Secret detection   | Search for secrets leaked in the code.                                                                                                                            |
| DAST               | Dynamic Application Security Testing. They perform the scan from outside while the application is running in its environment.                                     |
| Finding collection | This category refers to checktypes that do not run the analysis themselves. Instead, they collect the findings from 3rd party systems like Tenable.io or Vulners. |
| Recon              | Checktypes focused on reconnaissance activities. For instance, port scanning and service discovery.                                                               |
| Data analysis      | Checktypes focused on processing data sets to extract information considered relevant from an information security point of view.                                 |

## Enabled by default

| Checktype                                                                                    | Description                                                                                                                        | Security Control                    |
|----------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------|
| [vulcan-semgrep](https://github.com/adevinta/vulcan-checks/tree/master/cmd/vulcan-semgrep)   | Finds potential issues in source code from a Git repository using Semgrep. Official Documentation: <https://semgrep.dev/docs>      | SAST                                |
| [vulcan-trivy](https://github.com/adevinta/vulcan-checks/tree/master/cmd/vulcan-trivy)       | Scan docker images and Git repositories using aquasec/trivy. Official Documentation: <https://aquasecurity.github.io/trivy/latest> | SCA, IaC security, Secret detection |
| [vulcan-retirejs](https://github.com/adevinta/vulcan-checks/tree/master/cmd/vulcan-retirejs) | Check web pages for vulnerable JavaScript libraries. Official Documentation: <https://retirejs.github.io/retire.js>                | SCA                                 |
| [vulcan-nuclei](https://github.com/adevinta/vulcan-checks/tree/master/cmd/vulcan-nuclei)     | Scan web addresses with projectdiscovery/nuclei. Official Documentation: <https://docs.projectdiscovery.io/tools/nuclei>           | DAST                                |
| [vulcan-zap](https://github.com/adevinta/vulcan-checks/tree/master/cmd/vulcan-zap)           | Runs an OWASP ZAP passive or active scan. Official Documentation: <https://www.zaproxy.org/docs>                                   | DAST                                |

Since the check versions are updated regularly in an automatic way, the best way
to know the version that Lava is using is checking the source code of each
check.

## Disabled by default

| Checktype                                                                                                            | Description                                                                             | Security Control   |
|----------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------|--------------------|
| [vulcan-aws-alerts](https://github.com/adevinta/vulcan-checks/tree/master/cmd/vulcan-aws-alerts)                     | Detects general issues for an AWS account.                                              | DAST               |
| [vulcan-aws-trusted-advisor](https://github.com/adevinta/vulcan-checks/tree/master/cmd/vulcan-aws-trusted-advisor)   | Runs an AWS Trusted Advisor check against an AWS account.                               | DAST               |
| [vulcan-blast-radius](https://github.com/adevinta/vulcan-checks/tree/master/cmd/vulcan-blast-radius)                 | Calculates the blast radius of an asset.                                                | Data analysis      |
| [vulcan-burp](https://github.com/adevinta/vulcan-checks/tree/master/cmd/vulcan-burp)                                 | Runs a Burp Suite Enterprise Edition scan.                                              | DAST               |
| [vulcan-dmarc](https://github.com/adevinta/vulcan-checks/tree/master/cmd/vulcan-dmarc)                               | Checks if a domain have valid DNS configuration for DMARC.                              | DAST               |
| [vulcan-drupal](https://github.com/adevinta/vulcan-checks/tree/master/cmd/vulcan-drupal)                             | Checks for some vulnerable versions of Drupal.                                          | DAST               |
| [vulcan-exposed-bgp](https://github.com/adevinta/vulcan-checks/tree/master/cmd/vulcan-exposed-bgp)                   | Checks for exposed BGP port on Internet routers.                                        | DAST               |
| [vulcan-exposed-db](https://github.com/adevinta/vulcan-checks/tree/master/cmd/vulcan-exposed-db)                     | Checks if an asset has database well known ports open.                                  | DAST               |
| [vulcan-exposed-http](https://github.com/adevinta/vulcan-checks/tree/master/cmd/vulcan-exposed-http)                 | Checks if an asset has HTTP well known ports open.                                      | Recon              |
| [vulcan-exposed-memcached](https://github.com/adevinta/vulcan-checks/tree/master/cmd/vulcan-exposed-memcached)       | Checks if the asset contains an exposed Memcached server.                               | DAST               |
| [vulcan-exposed-router-ports](https://github.com/adevinta/vulcan-checks/tree/master/cmd/vulcan-exposed-router-ports) | Checks if an asset has routers well known ports open.                                   | DAST               |
| [vulcan-exposed-services](https://github.com/adevinta/vulcan-checks/tree/master/cmd/vulcan-exposed-services)         | Checks if a host has any open ports by scanning the 1000 most common TCP and UDP ports. | Recon              |
| [vulcan-exposed-ssh](https://github.com/adevinta/vulcan-checks/tree/master/cmd/vulcan-exposed-ssh)                   | Checks SSH server configuration for compliance with Mozilla OpenSSH guidelines.         | DAST               |
| [vulcan-github-alerts](https://github.com/adevinta/vulcan-checks/tree/master/cmd/vulcan-github-alerts)               | Retrieves existing vulnerability alerts for a Github repository.                        | Finding collection |
| [vulcan-gitleaks](https://github.com/adevinta/vulcan-checks/tree/master/cmd/vulcan-gitleaks)                         | Finds potential secrets in source code from a Git repository using gitleaks.            | Secret detection   |
| [vulcan-heartbleed](https://github.com/adevinta/vulcan-checks/tree/master/cmd/vulcan-heartbleed)                     | Checks if an asset is vulnerable to Heartbleed.                                         | DAST               |
| [vulcan-host-discovery](https://github.com/adevinta/vulcan-checks/tree/master/cmd/vulcan-host-discovery)             | Performs a quick Nmap ping scan that identifies which hosts are up.                     | Recon              |
| [vulcan-http-headers](https://github.com/adevinta/vulcan-checks/tree/master/cmd/vulcan-http-headers)                 | Analyzes the HTTP headers using Mozilla Observatory.                                    | DAST               |
| [vulcan-ipv6](https://github.com/adevinta/vulcan-checks/tree/master/cmd/vulcan-ipv6)                                 | Checks for IPv6 presence.                                                               | Recon              |
| [vulcan-masscan](https://github.com/adevinta/vulcan-checks/tree/master/cmd/vulcan-masscan)                           | Checks if a host has any open port by scanning the whole TCP port range using masscan.  | Recon              |
| [vulcan-mx](https://github.com/adevinta/vulcan-checks/tree/master/cmd/vulcan-mx)                                     | Checks for MX DNS Records.                                                              | Recon              |
| [vulcan-nessus](https://github.com/adevinta/vulcan-checks/tree/master/cmd/vulcan-nessus)                             | Runs a Nessus scan.                                                                     | DAST               |
| [vulcan-prowler](https://github.com/adevinta/vulcan-checks/tree/master/cmd/vulcan-prowler)                           | Runs Prowler against an AWS account.                                                    | DAST               |
| [vulcan-smtp-open-relay](https://github.com/adevinta/vulcan-checks/tree/master/cmd/vulcan-smtp-open-relay)           | Check for testing SMTP Open Relay.                                                      | DAST               |
| [vulcan-spf](https://github.com/adevinta/vulcan-checks/tree/master/cmd/vulcan-spf)                                   | Checks if a domain has a SPF record on DNS.                                             | DAST               |
| [vulcan-tenable](https://github.com/adevinta/vulcan-checks/tree/master/cmd/vulcan-tenable)                           | Retrieves findings from assets scanned by Tenable.io.                                   | Finding collection |
| [vulcan-vulners](https://github.com/adevinta/vulcan-checks/tree/master/cmd/vulcan-vulners)                           | Runs the nmap-script vulners against the target opened ports.                           | DAST               |
| [vulcan-wpscan](https://github.com/adevinta/vulcan-checks/tree/master/cmd/vulcan-wpscan)                             | Runs Wordpress scan.                                                                    | DAST               |
