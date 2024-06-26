# Controls and customization

Behind the scenes Lava makes use of other security tools and custom security 
checks  to perform a security scan. Tools are integrated through what is called 
["checktypes"](helpdoc/checktypes.md).

Checktypes are part of the Vulcan ecosystem and both Vulcan and Lava share the 
same collection located at <https://github.com/adevinta/vulcan-checks>

The following table provides a comprehensive list of the checktypes currently 
available:

| Checktype                   | Description                                                                            | Type of Control                     | Included by Default |
|-----------------------------|----------------------------------------------------------------------------------------|-------------------------------------|---------------------|
| vulcan-aws-alerts           | Detects general issues for an AWS account                                              | DAST - Infrastructure               |                     |
| vulcan-aws-trusted-advisor  | Runs an AWS Trusted Advisor check against an AWS account                               | DAST - Infrastructure               |                     |
| vulcan-blast-radius         | Calculates the blast radius of an asset.                                               | Data Analysis                       |                     |
| vulcan-burp                 | Runs a Burp Suite Enterprise Edition scan.                                             | DAST - Application                  |                     |
| vulcan-dmarc                | Checks if a domain have valid DNS configuration for DMARC                              | DAST - Infrastructure               |                     |
| vulcan-drupal               | Checks for some vulnerable versions of Drupal.                                         | DAST - Application                  |                     |
| vulcan-exposed-bgp          | Checks for exposed BGP port on Internet routers                                        | DAST - Infrastructure               |                     |
| vulcan-exposed-db           | Checks if an asset has database well known ports open                                  | DAST - Infrastructure               |                     |
| vulcan-exposed-http         | Checks if an asset has HTTP well known ports open                                      | Recon                               |                     |
| vulcan-exposed-memcached    | Checks if the asset contains an exposed Memcached server                               | DAST - Infrastructure               |                     |
| vulcan-exposed-router-ports | Checks if an asset has routers well known ports open.                                  | DAST - Infrastructure               |                     |
| vulcan-exposed-services     | Checks if a host has any open ports by scanning the 1000 most common TCP and UDP ports | Recon                               |                     |
| vulcan-exposed-ssh          | Checks SSH server configuration for compliance with Mozilla OpenSSH guidelines         | DAST - Infrastructure               |                     |
| vulcan-github-alerts        | Retrieves existing vulnerability alerts for a Github repository                        | Finding Collection                  |                     |
| vulcan-gitleaks             | Finds potential secrets in source code from a Git repository using gitleaks            | Secret Detection                    |                     |
| vulcan-heartbleed           | Checks if an asset is vulnerable to Heartbleed                                         | DAST - Infrastructure               |                     |
| vulcan-host-discovery       | Performs a quick Nmap ping scan that identifies which hosts are up                     | Recon                               |                     |
| vulcan-http-headers         | Analyzes the HTTP headers using Mozilla Observatory                                    | DAST - Application                  |                     |
| vulcan-ipv6                 | Checks for IPv6 presence                                                               | Recon                               |                     |
| vulcan-masscan              | Checks if a host has any open port by scanning the whole TCP port range using masscan  | Recon                               |                     |
| vulcan-mx                   | Checks for MX DNS Records                                                              | Recon                               |                     |
| vulcan-nessus               | Runs a Nessus scan                                                                     | DAST - Application & Infrastructure |                     |
| vulcan-nuclei               | Scan web addresses with projectdiscovery/nuclei                                        | DAST - Application                  | ✅                   |
| vulcan-prowler              | Runs Prowler against an AWS account                                                    | DAST - Infrastructure               |                     |
| vulcan-retirejs             | Check web pages for vulnerable JavaScript libraries                                    | SCA                                 | ✅                   |
| vulcan-semgrep              | Finds potential issues in source code from a Git repository using Semgrep              | SAST - Application                  | ✅                   |
| vulcan-smtp-open-relay      | Check for testing SMTP Open Relay                                                      | DAST - Infrastructure               |                     |
| vulcan-spf                  | Checks if a domain has a SPF record on DNS                                             | DAST - Infrastructure               |                     |
| vulcan-tenable              | Retrieves findings from assets scanned by Tenable.io                                   | Finding Collection                  |                     |
| vulcan-trivy                | Scan docker images and Git repositories using aquasec/trivy                            | SCA, Secret Detection, SAST - IaC   | ✅                   |
| vulcan-vulners              | Runs the nmap-script vulners against the target opened ports                           | DAST - Infrastructure               |                     |
| vulcan-wpscan               | Runs Wordpress scan                                                                    | DAST - Application                  |                     |
| vulcan-zap                  | Runs an OWASP ZAP passive or active scan                                               | DAST - Application                  | ✅                   |


The table also classifies each checktype based on the security controls that it 
covers.


* DAST: Dynamic Application Security Testing. Which is divided in:
    * DAST - Infrastructure: Dynamic analysis of infrastructure-related assets.
    * DAST - Application: Dynamic analysis of application-related assets.
* SAST: Static Application Security Testing. Which is divided in:
    * SAST - Application: Static analysis of application-related assets. In 
      other words, security analysis of the source code of an application.
    * SAST - IaC: Static analysis of Infrastructure as Code manifests. For 
      instance, AWS CloudFormation templates or Terraform configurations.
* SCA: Software Composition Analysis. For instance, detection of outdated 
  dependencies.
* Secret detection
* Finding collection: This category referees to checktypes that do not run the 
  analysis themselves. Instead, they  collect the findings from 3rd party 
  systems like Tenable.io or vulners.
* Recon: Checktypes focused on reconnaissance activities. For instance, port 
  scanning and service discovery.
* Data analysis: Checktypes focused on processing already available data to 
  produce results from the point of view of information security.
