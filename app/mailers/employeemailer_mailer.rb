class EmployeemailerMailer < ApplicationMailer

	default from: 'notifications@example.com'
   
   def employee_email(employee)
      @employee = employee
      @url  = 'http://www.gmail.com'
      mail(to: 'prateektiwari241189@gmail.com', subject: 'New Skill is added to the employee skill set')
   end
end
