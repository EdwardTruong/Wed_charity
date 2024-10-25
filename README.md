Hi there, If you see this GitHub account, it means there is an issue with my main account, but don't worry as the code is still being updated here, just a bit less frequently. I will soon update my main account and code on this account.

# Website charity

This is a basic website about Spring Core with Hibernate technology using JSP.




## Knowledges

 - Spring MVC (Model View Controller).
 - Hibernate ORM (Object-Relational Mapping).   
 - Spring Session (HttpSession).
 - Get infomations from a Urls / Form (head - body).



## Description

In the project, there are only 2 distinct roles:  Admin and User.


This project does not use Spring Security, so it will use HttpSession to manage access rights for each user.

  
  ADIMN :

    - An admin can create posts for funds in need of support.
    - An admin can create users and choose roles for themselves.
    - An Admin can approve and cancel the amount of money that the user has supported.
    - Find user(s) or post(s) by key words

   USER :
   
    - Users can register an account. 
    - They can access posts without logging in. 
    - After logging in, they can support an amount for a post.



    

## Roadmap

- [Get requirements](https://docs.google.com/document/d/1oTqMDtLbreuIKdSJ_13BvGxRNrUfuNGwANtwvrZjo1g/edit)
- [Build database](https://docs.google.com/document/d/1Z-Lqp5meYhGVKfA7tNwrsgXg9MA8Fh6TXjA5MQBBq6A/edit?usp=drive_web&ouid=115396594857376540567)
- [Design layers](https://docs.google.com/document/d/1r5MbeOKEgwjRVvfmvEOLiuBYV8l9dXQ3C4Yw5Weg2qM/edit)
- [Design UI / Fix](https://docs.google.com/document/d/15nYJWszIoEzKq2hDkqH1ndpb3sxyMhDmQQrNOyECAxk/edit)
- Exploratory Testing


## Authors



- [@TruongTNFx](https://www.github.com/TruongTNFx)



- [@EdwardTruong - Spring Boot 3.3.1](https://github.com/EdwardTruong/Charity)
Apart from the project using Spring Core along with Hibernate and JSP, I also have a similar project using Spring Boot and Thymeleaf with similar features, but without writing too much under the Repository layer.


## 🛠 Skills

Front-end : JSP

Back-end : HttpSession, pagination with query



## Main project







This is Home page without login and when login success.
![Home page](https://github.com/user-attachments/assets/4762a4c8-9000-4f0b-9d82-a2e48bd4bb57)




When you access any recommendation for more details.
![Detail](https://github.com/user-attachments/assets/6ddaedb7-cf11-4d11-a14e-2129c1073eb8)




When you click on the donate button, a pop-up will appear.
![pop-up](https://github.com/user-attachments/assets/4e632c71-de8f-4993-95b8-ee371184f5bc)




When you have successfully supported from the home page or detail page, a notification will appear within the donation detail page you have supported.
![Detail dotion success](https://github.com/user-attachments/assets/ee82ecee-f05f-4a60-bf8d-6664f5ae64ea)




You can see it when go to page number 2!
![See detail](https://github.com/user-attachments/assets/373f6592-9d33-4282-b291-f6c6849f714f)




This is admin login and manage entity :   
![Admin Pages (1)](https://github.com/user-attachments/assets/3858393f-8a9c-4f93-9e63-296579144dd1)




Quick active user:
![Main Page](https://github.com/user-attachments/assets/b74923f1-c502-44ad-af98-3578b5c89b3f)


Users can log in and view the details of donation campaigns, and nothing else.
![Main Page](https://github.com/user-attachments/assets/d3493ffc-bf1f-4f44-98cc-6750c648479c)



Admin can edit some infomation's user : 
![Admin edit user](https://github.com/user-attachments/assets/ab34ea08-7d03-4946-83cd-34ea1dbf414f)


Admin delete User : (When a user's donation has been approved by the admin and the user's account is subsequently deleted for any reason, the donation amount remains intact.)
![Delete account](https://github.com/user-attachments/assets/50a04ad5-c0d9-40dd-afaa-b8400304002e)


Admin create a donation : 
![Create new a donation ](https://github.com/user-attachments/assets/4f823577-7f2d-4da2-8ef4-395cdf437c0d)


Manager donations : 
![ManagerDonations_home donation_page](https://github.com/user-attachments/assets/207e8168-d5dd-457d-b253-0f10c1bd6050)

In detail a donation: 
![ManagerDonations_home donation_detail](https://github.com/user-attachments/assets/4a87779b-4c50-4dc7-ae1b-dc4f26dc9e4b)


Upon admin confirmation, the donation amount was automatically incremented.
![amount](https://github.com/user-attachments/assets/e1fff6c5-0145-4abf-b1f4-4c503d232df8)


Admin delete user donatied : 
![delete userDonation](https://github.com/user-attachments/assets/a84b805c-0130-4322-9f8f-39809dae61ee)


Admin denied a donated 
![esc_donated](https://github.com/user-attachments/assets/f0f0cd0b-f775-41e0-8f97-b5f42ed89155)


Pagination : 
![Pagination](https://github.com/user-attachments/assets/4ce7bdf4-513c-4fe9-bdf2-fbade18e0917)

    
Searching / Pagination : 
   code : 

     	   
        @Override
       	public List<UserEntity> searchingFindUserByEmailOrPhoneNumber(String input, int pageNo, int pageSize) {
       		 Session session = sessionFactory.getCurrentSession();
       		    String queryString = "SELECT u FROM UserEntity u WHERE u.email LIKE CONCAT('%', :input, '%') OR u.phoneNumber LIKE CONCAT('%', :input, '%')";		    
       		    Query query = session.createQuery(queryString);
       		    query.setParameter("input", input);
       		    query.setFirstResult((pageNo-1)*pageSize);
       			query.setMaxResults(pageSize);
       		    List<UserEntity> users = query.getResultList();
       		    return users;
       	}

![Main Page](https://github.com/user-attachments/assets/46dfe66a-d979-4acc-bfbe-d68c944e7a9b)
          
        	@Override
        	public List<Donation> foundDonationByInfo(String input, int pageNo, int pageSize, int status) {
        		   Session session = sessionFactory.getCurrentSession();
        		   String queryString = "SELECT d FROM Donation d WHERE CONCAT(d.code,' ',d.phoneNumber, ' ', d.organizationName, ' ', d.status) LIKE :input OR d.status = :status";
        		 
        		    Query query = session.createQuery(queryString);
        		    query.setParameter("input", "%" + input + "%"); // set value param with "%" to find depend on input
        		    query.setParameter("status", status);
        		    query.setFirstResult((pageNo-1)*pageSize);
        			query.setMaxResults(pageSize);
        		    List<Donation> donations = query.list();
        		    return donations;
        	}

![Foundpage](https://github.com/user-attachments/assets/07875f40-46d6-4989-87f3-6a28f53ac48d)



        



