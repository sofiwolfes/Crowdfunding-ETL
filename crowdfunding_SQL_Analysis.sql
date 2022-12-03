-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 
SELECT * FROM campaign;

SELECT cf_id, backers_count
FROM campaign
WHERE outcome = 'live'
ORDER BY backers_count DESC
;


-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.
SELECT * FROM backers;

SELECT backers.cf_id, COUNT(*)
FROM backers
JOIN campaign ON backers.cf_id = campaign.cf_id
WHERE campaign.outcome = 'live'
GROUP BY backers.cf_id
ORDER BY COUNT(*) DESC
;


-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 

SELECT * FROM contacts;
SELECT * FROM campaign;

CREATE TABLE email_contacts_remaining_goal_amount
AS
SELECT first_name, last_name, email, (goal-pledged) AS "Remaining Goal Amount"
FROM campaign AS ca
JOIN contacts AS co
ON ca.contact_id = co.contact_id
WHERE ca.outcome = 'live'
ORDER BY "Remaining Goal Amount" DESC

-- Check the table
SELECT * FROM email_contacts_remaining_goal_amount;

-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 



-- Check the table


