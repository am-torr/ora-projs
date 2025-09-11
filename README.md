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

**Challenges encountered:**
- [X] getting the image push to work, not working on cloudshell, solution is to install aws cli
- [X] aws cli conflict with docker, fixed by configuring the correct paths in powershell
- [X] setting the correct policies in AWS
- [X] secret not working on GitHub due to bug

**Current Progress:**
Image has been pushed to repository:
<img width="929" height="246" alt="image" src="https://github.com/user-attachments/assets/6c19d38c-1789-4e9e-b8c0-62ef7333a2a8" />

