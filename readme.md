<h1 align="left">1. Explain the Primary Key and Foreign Key concepts in PostgreSQL.</h1>

###

<h2 align="left">PostgreSQL-Primary KEY</h2>

###

<p align="left">একটি কলাম (বা কলাম) যা একটি টেবিলের প্রতিটি সারিকে স্বতন্ত্রভাবে চিহ্নিত করে।<br>উদ্দেশ্য:<br>নিশ্চিত করে স্বতন্ত্রতা (কোন নকল নেই) এবং নন-নাল মান<br>রেকর্ডের প্রধান শনাক্তকারী হিসেবে কাজ করে।<br>বিদেশী কী দ্বারা দক্ষ ইন্ডেক্সিং এবং রেফারেন্সিং সক্ষম করে।<br>বৈশিষ্ট্য:<br>অনন্য এবং নন-নাল হতে হবে।<br>প্রতি টেবিলে শুধুমাত্র একটি প্রাথমিক কী (যৌগিক হতে পারে)।</p>

###

<p align="left">CREATE TABLE users (<br>    user_id SERIAL PRIMARY KEY,<br>    username VARCHAR(50)<br>);</p>

###

<h2 align="left">PostgreSQL-Foreign KEY</h2>

###

<p align="left">একটি টেবিলের একটি কলাম (বা কলাম) যা অন্য টেবিলে একটি প্রাথমিক কী (বা অনন্য কী) উল্লেখ করে।<br>উদ্দেশ্য:<br>প্রতিষ্ঠা করে সম্পর্ক টেবিলের মধ্যে।<br>বলবৎ করে রেফারেন্সিয়াল অখণ্ডতা (উল্লেখিত সারণীতে মান থাকতে হবে বা NULL হতে হবে)।<br>ডেটা সামঞ্জস্য বজায় রাখে।<br>বৈশিষ্ট্য:<br>একটি প্রাথমিক/অনন্য কী উল্লেখ করে।<br>বাতিলযোগ্য হতে পারে (যদি না সীমাবদ্ধ থাকে)।</p>

###

<p align="left">CREATE TABLE orders (<br>    order_id SERIAL PRIMARY KEY,<br>    user_id INT,<br>    FOREIGN KEY (user_id) REFERENCES users (user_id) ON DELETE CASCADE<br>);</p>

###

<p align="left">মূল পার্থক্য<br>প্রাথমিক কী: স্বতন্ত্রভাবে তার টেবিলে সারি চিহ্নিত করে; কোন সদৃশ বা NULL.<br>বিদেশী কী: অন্য টেবিলে একটি প্রাথমিক/অনন্য কী লিঙ্ক; সম্পর্ক প্রয়োগ করে।</p>

###

<h1 align="left">2. Explain the purpose of the WHERE clause in a SELECT statement.</h1>

###

<p align="left">WHERE ধারা একটি PostgreSQL এ SELECT স্টেটমেন্ট ব্যবহার করা হয় ফিল্টার সারি নির্দিষ্ট শর্তের উপর ভিত্তি করে একটি টেবিল থেকে, আপনাকে শুধুমাত্র সেই মানদণ্ডগুলি পূরণ করে এমন ডেটা পুনরুদ্ধার করার অনুমতি দেয়।<br>উদ্দেশ্য :<br>ডেটা ফিল্টারিং: সারিতে সেট করা ফলাফলকে সীমাবদ্ধ করে যেখানে শর্তটি সত্যে মূল্যায়ন করা হয়।<br>যথার্থতা: অপ্রয়োজনীয় ডেটা পুনরুদ্ধার হ্রাস করে লক্ষ্যযুক্ত প্রশ্নগুলি সক্ষম করে৷<br>নমনীয়তা: অপারেটর (যেমন, =, >, <, LIKE, IN) এবং লজিক্যাল অপারেটর (AND, OR, NOT) ব্যবহার করে বিভিন্ন শর্ত সমর্থন করে।<br>যোগদান এবং সম্পর্ক: প্রায়শই টেবিল জুড়ে সম্পর্কিত ডেটা ফিল্টার করতে JOIN এর সাথে ব্যবহার করা হয়।</p>

###

<h2 align="left">Syntax</h2>

###

<p align="left">SELECT column1, column2<br>FROM table_name<br>WHERE condition;</p>

###

<p align="left">SELECT username, email<br>FROM users<br>WHERE user_id = 1;</p>

###

<p align="left">SELECT username, email<br>FROM users<br>WHERE user_id = 1;</p>

###

<h2 align="left">মূল পয়েন্ট</h2>

###

<p align="left">Conditions: তুলনা অন্তর্ভুক্ত করতে পারে (যেমন, বয়স > 18), নিদর্শন (যেমন, ব্যবহারকারীর নাম 'A%' এর মতো), বা একাধিক মানদণ্ড (যেমন, বয়স > 18 এবং শহর = 'ঢাকা')।<br>Performance: দ্রুত প্রশ্নের জন্য WHERE ক্লজের কলামে সূচী ব্যবহার করুন।<br>NULL Handling: শূন্য মান পরীক্ষা করতে IS NULL বা IS NULL NULL ব্যবহার করুন (যেমন, যেখানে ইমেল শূন্য নয়)।</p>

###

<h1 align="left">3. What is the significance of the JOIN operation, and how does it work in PostgreSQL?</h1>

###

<h2 align="left">Significance of the JOIN Operation in PostgreSQL</h2>

###

<p align="left">The JOIN পোস্টগ্রেএসকিউএল-এ অপারেশন রিলেশনাল ডাটাবেসের একটি মৌলিক প্রক্রিয়া যা আপনাকে অনুমতি দেয় দুই বা ততোধিক টেবিল থেকে সারি একত্রিত করুন একটি সম্পর্কিত কলামের উপর ভিত্তি করে, সাধারণত একটি প্রাথমিক কী এবং বিদেশী কী সম্পর্ক। এর তাত্পর্য একাধিক টেবিল জুড়ে সম্পর্কিত ডেটার দক্ষ অনুসন্ধান সক্ষম করার মধ্যে নিহিত, যা রিলেশনাল ডাটাবেস ডিজাইনের জন্য অপরিহার্য।</p>

###

<h2 align="left">INNER JOIN (or JOIN)</h2>

###

<p align="left">SELECT u.username, o.order_id<br>FROM users u<br>INNER JOIN orders o<br>ON u.user_id = o.user_id;</p>

###

<h2 align="left">LEFT OUTER JOIN (or LEFT JOIN):</h2>

###

<p align="left">SELECT u.username, o.order_id<br>FROM users u<br>LEFT JOIN orders o<br>ON u.user_id = o.user_id;</p>

###

<h2 align="left">RIGHT OUTER JOIN (or RIGHT JOIN):</h2>

###

<p align="left">SELECT u.username, o.order_id<br>FROM users u<br>RIGHT JOIN orders o<br>ON u.user_id = o.user_id;</p>

###

<h2 align="left">FULL OUTER JOIN (or FULL JOIN):</h2>

###

<p align="left">SELECT u.username, o.order_id<br>FROM users u<br>FULL JOIN orders o<br>ON u.user_id = o.user_id;</p>

###

<h2 align="left">CROSS JOIN:</h2>

###

<p align="left">SELECT u.username, c.course_name<br>FROM users u<br>CROSS JOIN courses c;</p>

###

<h1 align="left">4. Explain the GROUP BY clause and its role in aggregation operations.</h1>

###

<h2 align="left">GROUP BY Clause in PostgreSQL</h2>

###

<p align="left">SELECT column1, column2, AGGREGATE_FUNCTION(column3)<br>FROM table_name<br>[WHERE condition]<br>GROUP BY column1, column2;</p>

###

<h2 align="left">আপনার পোর্টফোলিওর ব্যাকএন্ডে একটি পোস্ট টেবিল বিবেচনা করুন:</h2>

###

<p align="left">CREATE TABLE posts (<br>    post_id SERIAL PRIMARY KEY,<br>    user_id INT,<br>    category VARCHAR(50),<br>    created_date DATE<br>);</p>

###

<h2 align="left">নমুনা তথ্য সন্নিবেশ করান:</h2>

###

<p align="left">INSERT INTO posts (user_id, category, created_date) VALUES<br>(1, 'Tech', '2025-05-01'),<br>(1, 'Tech', '2025-05-02'),<br>(2, 'Lifestyle', '2025-05-03'),<br>(2, 'Tech', '2025-05-04');</p>

###

<p align="left">GROUP BY এর সাথে প্রশ্ন:</p>

###

<p align="left">SELECT user_id, category, COUNT(*) as post_count<br>FROM posts<br>GROUP BY user_id, category;</p>

###

<h2 align="left">Combining with WHERE</h2>

###

<p align="left">SELECT user_id, COUNT(*) as post_count<br>FROM posts<br>WHERE created_date >= '2025-05-02'<br>GROUP BY user_id;</p>

###

<p align="left">SELECT user_id, COUNT(*) as post_count<br>FROM posts<br>WHERE created_date >= '2025-05-02'<br>GROUP BY user_id;</p>

###

<h1 align="left">5. How can you calculate aggregate functions like COUNT(), SUM(), and AVG() in PostgreSQL?</h1>

###

<p align="left">PostgreSQL এ, aggregate ফাংশন যেমন COUNT(), SUM(), এবং AVG() সারিগুলির একটি সেটে গণনা সম্পাদন করতে ব্যবহৃত হয়, প্রায়শই GROUP BY ধারার সাথে সংমিশ্রণে, ডেটা সংক্ষিপ্ত করতে। নীচে, আমি ব্যাখ্যা করব কীভাবে এই ফাংশনগুলি, তাদের উদ্দেশ্যগুলি এবং ব্যবহারিক উদাহরণগুলি গণনা করা যায়, এটিকে সংক্ষিপ্ত এবং আপনার "Edu-Hub" পোর্টফোলিও প্রসঙ্গে (যেমন, ব্লগ পোস্ট বা ব্যবহারকারীর ডেটার জন্য) প্রাসঙ্গিক রেখে৷ আমি সিনট্যাক্স, ব্যবহার এবং সেরা অনুশীলনগুলিও কভার করব।</p>

###

<h2 align="left">Overview of Aggregate Functions</h2>

###

<p align="left">সমষ্টিগত ফাংশন একটি একক সংক্ষিপ্ত মান ফেরত দিতে মানগুলির একটি সেট প্রক্রিয়া করে:<br>COUNT(): সারির সংখ্যা গণনা করে (অথবা একটি কলামে নন-নাল মান)।<br>SUM(): একটি কলামে সাংখ্যিক মান যোগ করে।<br>AVG(): একটি কলামে সাংখ্যিক মানের গড় গণনা করে।<br>এই ফাংশনগুলি সাধারণত SELECT স্টেটমেন্টে ব্যবহৃত হয় এবং সমস্ত সারি বা গোষ্ঠীবদ্ধ সারিগুলিতে প্রয়োগ করা যেতে পারে (GROUP BY ব্যবহার করে)।</p>

###

<h2 align="left">Syntax</h2>

###

<p align="left">SELECT column_to_group_by, AGGREGATE_FUNCTION(column)<br>FROM table_name<br>[WHERE condition]<br>[GROUP BY column_to_group_by]<br>[HAVING condition];</p>

###

<h2 align="left">COUNT()</h2>

###

<p align="left">COUNT(*) -- Counts all rows<br>COUNT(column) -- Counts non-null values in column<br>COUNT(DISTINCT column) -- Counts unique non-null values</p>

###

<p align="left">SELECT user_id, COUNT(*) as post_count<br>FROM posts<br>GROUP BY user_id;</p>

###

<h2 align="left">SUM()</h2>

###

<p align="left">SELECT user_id, SUM(fee) as total_fees<br>FROM courses<br>GROUP BY user_id;</p>

###

<h2 align="left">With WHERE:</h2>

###

<p align="left">SELECT SUM(fee) as total_may_fees<br>FROM courses<br>WHERE created_date >= '2025-05-01';</p>

###

<h2 align="left">AVG()</h2>

###

<p align="left">SELECT course_id, AVG(rating) as avg_rating<br>FROM ratings<br>GROUP BY course_id;</p>

###

<h2 align="left">With WHERE and HAVING:</h2>

###

<p align="left">SELECT course_id, AVG(rating) as avg_rating<br>FROM ratings<br>WHERE rating > 0<br>GROUP BY course_id<br>HAVING AVG(rating) >= 4;</p>

###

<h2 align="left">আপনি একটি একক প্রশ্নে একাধিক সমষ্টিগত ফাংশন ব্যবহার করতে পারেন:</h2>

###

<p align="left">SELECT user_id, <br>       COUNT(*) as post_count, <br>       SUM(fee) as total_fees, <br>       AVG(rating) as avg_rating<br>FROM posts p<br>JOIN courses c ON p.user_id = c.user_id<br>JOIN ratings r ON c.course_id = r.course_id<br>GROUP BY user_id;</p>

###
