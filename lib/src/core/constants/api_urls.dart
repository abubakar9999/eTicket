class ApiUrls {
 logIn() => "https://api.server1st.dpdns.org/v1/auth/login/company";
 subuserLogIn(int companyId) => "https://api.server1st.dpdns.org/v1/auth/login/subuser?companyId=$companyId";
 userCreate() => "https://api.server1st.dpdns.org/v1v1/company/1/subusers";
 getUsers(int role) => "https://api.server1st.dpdns.org/v1v1/company/1/subusers?role=$role";

}
