# ora-projs<br/>
Oracle projects collection by am-torr - [go to MAIN branch - (click here)](https://github.com/am-torr/ora-projs/tree/main)<br/><br/>
> [!NOTE]
> **Project:** Github Actions Deployment <br/>
> **Description:** Using CI/CD pipeline for automated deployment. Creates build ticket after the user creates Pull Request.<br/>
> **Benefits:**</br>
> &emsp; * Faster Deployment</br>
> &emsp; * Ease of use</br>
> &emsp; * Improve code quality</br>
> &emsp; * Improve maintainability</br>
> &emsp; * Reduces operational cost</br>
> **Status:** In Progress<br/>


**General Checklist**</br>
- [X] define github actions trigger </br>
- [ ] define github actions build ticket creation</br>
- [ ] connect slack for deployment notifications</br>
- [ ] connect the deployment tool (AWS) </br>

**Tools/Tech used**
- PowerShell
- VSCode
- Github
- AWS

**Challenges encountered:** </br>
- [X] getting the image push to work, not working on cloudshell, solution is to install aws cli
- [X] aws cli conflict with docker, fixed by configuring the correct paths in powershell
- [X] setting the correct policies in AWS
- [X] secret not working on GitHub due to bug

**Current Progress:** </br>
Image has been pushed to repository:
<img width="929" height="246" alt="image" src="https://github.com/user-attachments/assets/6c19d38c-1789-4e9e-b8c0-62ef7333a2a8" />

--

> [!NOTE]
> <b>Project Title - Mortgage Generator<b/><br/>
> Latest Branch: [MORTGAGE-INIT - (click here)](https://github.com/am-torr/ora-projs/tree/mortgage-init)<br/>
> Description - This project computes mortgages based on rate and remaining period parameters.<br/>
> &emsp;&emsp;&emsp;&emsp;&emsp;&emsp; Input in this example is based on monthly amortization from a local bank.<br/>
> &emsp;&emsp;&emsp;&emsp;&emsp;&emsp; Later, it will be used as a report.<br/>
> Status - In Progress<br/>

**General Checklist**</br>
- [X] Collect and generate the data</br>
- [ ] Format generated data</br>
- [ ] Save generated data to a table</br>
- [ ] Output the generated data from a table to a report (Oracle APEX or other front end)</br>

**Tools/Tech used**
- Data Modeler
- SQL Developer
- Github

**Challenges encountered:** </br>
- [X] gathering formula
- [X] transforming the formula to code

