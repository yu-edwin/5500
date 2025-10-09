# SmartFit - A Virtual Try-On Clothing Application: See how clothes fit you before buying!

## Description

Young adults typically struggle with clothing shopping and are much more open to experimentation to discover their personal fashion sense. However, some items could be sold out in stores or online orders do not fit as expected, resulting in excess amounts of time returning or tailoring outfits whether it be due to size/proportion mismatch or due to the item not fitting in with the rest of their wardrobe. Although the audience range of this is very broad with the term “young adult”, it is not limited to the broad definition and can be tailored towards students who want to explore new fashion personalizations, social media influencers, and/or fashion designers. However, our main target audience are college students who care about fashion while balancing affordability and brand recognition.

This app allows users to virtually try on clothes to see if they fit their body on a smartphone camera. This solves the problem that users face when they are unable to determine if online clothes fit them before receiving the product. An AI style tool where users can give a link to some clothing item, then the user is able to see through their phone camera how the given clothing looks virtually. For precise estimations, the user can input their measurements (waist/height) to receive visual confirmation that a piece of clothing will fit on the individual. The user may also have a virtual wardrobe which stores the clothing items that the user has searched previously, so they can experiment with different outfits that meet their personal goals.

The main idea is that when the user is online shopping, despite seeing how the clothes fit on the models, they are unable to see how it would look on themselves. This app would solve that by allowing users to see potential items in real-time and help them determine if a particular outfit works for him/herself. This would theoretically help reduce the amount of time students spend on returning or tailoring certain clothing if it seems unfit, and allow them to understand their personal fashion ideas. 

## Main Problem

Our audience faces multiple problems such as:

Fit uncertainty (size) - Currently product images places clothes on models/avatars and not the individual buying the clothes. This gives the customer a rough estimate on how the clothes would look, but fails to demonstrate how an outfit would look on the customer for a more accurate display.

Wasting time/money - Many customers are unsatisfied in their clothing item purchase due to many factors (size/style/fashion) and waste time by returning or tailoring. Our application aims to help our audience by reducing time/money.

Outfit/Fashion - Many brands now currently have multiple styles available and different types of clothes that companies have decided as the standard for society. However, this may be overwhelming for people since there are too many options, creating uncertainty and confusion.

## Requirements

The application should have the following:

Clothing link authenticator/integration
    Allows users to input a clothing link (URL) to import clothing piece

Virtual body simulation
    Accepts user body measurements to improve fitting accuracy
    Users should be able to adjust their measurements whenever

Fit estimation
    Determines if the clothing the user picked will fit the individual using the app

Virtual Wardrobe
    Users should have a virtual wardrobe separating clothing items by type (shirt, pants, etc)

Outfit View
    Users should be able to try on clothing pieces to determine how they would look

### Functional

1. As a user who wants to understand brand clothing size, I want to visualize the clothing on my visual person so I can forsee how I would appear before buying the items.
2. As a student getting into fashion, I want to be able to experiment on different types of clothing so I can visualize the outfits and generate new ideas in the future.
3. As a student unfamiliar with the current trends, I want to familiarize myself with different brands and outfits so I can be confident in my outwear and generate good impressions from others based on my outfit.
4. Get clothing items from any given website.
5. Convert the clothes from the website into AR clothes for the user.
6. Display and fit the AR clothing onto the user's body in the camera view.
7. Should be able to track the user's movement and adjust the AR clothing accordingly.

### Non-functional

1. Easy access though my mobile application anytime and anywhere.
2. Fast generation of images and response time.
3. Capable of storing large amounts of items in a wardrobe.
4. Core functionality accessible whilst offline.

### Ethical

1. Privacy of information
2. Never store images/measurements without consent from the user
3. Will collect only the necessary data required for app to function
4. Users should be able to delete their images/data anytime
5. Bias free (No one should have restricted access based on ethnicity/demographics)
6. No images generated should be harmful for the user
7. Encryption will store sensitive data (username/password) for users
8.  Avoid unrealistic images that may result in a negative reaction from user (body morphing)
9.  Will not include a social media aspect that may induce social anxiety or body shaming
10. Will support all genders identities, age, race, and other demographics.
11. A report button for any image generation that does not follow our guidelines. 

## User Dimensions Analysis

We considered multiple dimensions to categorize our target users:

1. **Fashion Sense (High/Low)** - How much users value fashion and trends
2. **Budget (High/Low)** - How much users are willing to spend on clothing
3. Tech Savviness (High/Low) - User's comfort with technology
4. Shopping Frequency (Regular/Occasional) - How often users shop for clothes

**Prioritization Rationale:**
We selected Fashion Sense and Budget as our two primary dimensions because:
- These two factors most directly influence clothing purchase decisions
- Our customer interviews revealed these as the strongest differentiators
- Tech savviness showed less variation among college students (our target)
- Shopping frequency correlated closely with fashion sense



## Target Users

After conducting the interviews, we decided to split our personas into 4 categories distinguished by how much emphasis they put into fashion and how much of a budget they are willing to spend. The first aspect is very self explanatory as an individual with high fashion sense would likely value fashion much more than a person with low fashion sense in which they would likely not have put too much thought in what they wear as long as it’s comfortable and works. The other category of budget can be a bit trickier. Some people prefer luxurious products such as Gucci, Louis Vuitton, etc and won’t mind spending extra for designer brand names. However, most people would likely not be willing to afford such luxurious items, but still recognize brands such as American Eagle, Hollister, Uniqlo, and etc, which places them in the neutral point. Individuals who value spending less for clothes are categorized in the low budget criteria. 
we decided on these two aspects to divide up our persona map into four quadrants since each person in their respective quadrants likely live different lifestyles since they have different values/mindset that influences the clothes that they choose. These people can be categorized as such: 

### User Personas

High Fashion/High Budget:
These people are likely more carefree and outgoing people who believe that the clothes/fashion of people help define who they are. They would be the people who would keep up with the latest fashion trends and know when new items are being released.

![](assets/PRD/PersonaHH.png)

Gemini Script: Can you generate a profile picture of an international asian male that is an undergraduate that is around 20 years old who is dripped out

High Fashion/Low Budget:
Individuals who likely enjoy finding a creative/original outfit that doesn’t necessarily include items with expensive logos/names. They might favor small local clothing shops and shop in outlets for potentially cheaper prices.

![](assets/PRD/PersonaHL.png)

Gemini Script: Can you generate a profile image of a stylish fashion designer (female) in her 30s who returns alot of clothing items and spends alot of time researching trends. Show her holding items that relate to her profession. 

Low Fashion/High Budget
These people don’t necessarily care about fashion trends or styles but rather feel more confident in the value of a brand association/more luxurious clothes. 

![](assets/PRD/PersonaLH.png)

Gemini Script: Can you make a profile picture of an american ethnicity male graduate student who lives a gym lifestyle. He has the mindset "If its not in my workout calander, it doesn't exist for me."

Low Fashion/Low Budget:
These people don’t care about their fashion choices, but wear clothes that are more comfortable and sustainable for their everyday life. They could be curious about new fashion trends and might want to change their wardrobe, but are uncertain on how to achieve that.

![](assets/PRD/PersonaLL.png)

Gemini Script: Can you generate a profile picture of a freshman male student who is struggling with clothes inside his dorm looking defeated with all the clothing options on the floor around him. He is sitting ontop of his clothes.

## Tasks

### Journy Mapping

![](assets/PRD/JourneyMapping.png)

### User Stories (INVEST+E Format with MoSCoW Prioritization)

#### High Fashion/High Budget Persona

**US-HH-1 (High Fashion/High Budget): Professional Outfit Recommendations**
- **As:** Alex Wang, a student attending campus career fairs
- **I want:** Curated outfit recommendations for professional events
- **So that:** I can feel confident and make a strong first impression with recruiters
- **Acceptance Criteria:**
  - System suggests 3-5 complete outfit combinations
  - Recommendations match professional dress code
  - Suggestions utilize items already in virtual wardrobe when possible
  - Response time under 5 seconds
- **Condition of Satisfaction:** 75% of users save at least one recommended professional outfit to their wardrobe
- **Priority:** Must Have
- **Estimate:** 8 story points

**US-HH-2 (High Fashion/High Budget): Exclusive Brand Discovery**
- **As:** Jeremy, an international student who enjoys luxury brands
- **I want:** To discover exclusive and trendy pieces from high-end brands
- **So that:** I can stand out confidently among my peers
- **Acceptance Criteria:**
  - System integrates with at least 5 luxury brand websites
  - Filter options for "trending" and "exclusive" items
  - Price range filtering available
  - Virtual try-on works with luxury brand imagery
- **Condition of Satisfaction:** Users discover and virtually try on at least 3 new luxury items per session
- **Priority:** Should Have
- **Estimate:** 13 story points

**US-HH-3 (High Fashion/High Budget): Designer Outfit Exploration**
- **As:** John Smith, a fashion designer
- **I want:** To explore various clothing combinations quickly
- **So that:** I can create mood boards and satisfy my clients
- **Acceptance Criteria:**
  - Mix-and-match feature for combining items
  - Save multiple outfit combinations
  - Export outfit images for presentations
  - Color coordination suggestions
- **Condition of Satisfaction:** Designers create and save at least 5 outfit combinations per session
- **Priority:** Could Have
- **Estimate:** 5 story points

#### High Fashion/Low Budget Persona

**US-HL-1 (High Fashion/Low Budget): Affordable Fashion Discovery**
- **As:** Matt Buff, a budget-conscious student who values fashion
- **I want:** To find stylish clothes from affordable stores
- **So that:** I can look fashionable without overspending
- **Acceptance Criteria:**
  - Filter by price range (e.g., under $30, $30-50)
  - Integration with affordable retailers (H&M, Zara, Uniqlo, etc.)
  - "Similar items, lower price" suggestion feature
  - Budget tracking for virtual wardrobe
- **Condition of Satisfaction:** 80% of users find and save at least 2 items under their specified budget per session
- **Priority:** Must Have
- **Estimate:** 8 story points

**US-HL-2 (High Fashion/Low Budget): Reliable Sizing and Fit**
- **As:** James, a student with a higher budget
- **I want:** Reliable sizing and fit suggestions
- **So that:** I can avoid frequent returns and tailoring costs
- **Acceptance Criteria:**
  - Body measurement input system
  - Fit prediction algorithm (Tight/Perfect/Loose)
  - Size comparison across different brands
  - Fit confidence score (0-100%)
- **Condition of Satisfaction:** Returns decrease by 20% for users who use fit prediction feature
- **Priority:** Must Have
- **Estimate:** 13 story points

**US-HL-3 (High Fashion/Low Budget): Social Media Fashion Growth**
- **As:** David, a beginner social media influencer
- **I want:** To virtually try iconic pieces from recognizable brands
- **So that:** I can grow my online presence and attract collaborations
- **Acceptance Criteria:**
  - Share virtual try-on images to social media
  - Hashtag and brand tag suggestions
  - Outfit "look-book" creation feature
  - Watermark-free export option
- **Condition of Satisfaction:** 60% of influencer users share at least one virtual try-on per week
- **Priority:** Could Have
- **Estimate:** 5 story points

#### Low Fashion/High Budget Persona

**US-LH-1 (Low Fashion/High Budget): Luxury Staple Items**
- **As:** Richard, a student who prioritizes high-quality clothing
- **I want:** To buy staple items from well-known luxury labels
- **So that:** I can feel confident through brand association
- **Acceptance Criteria:**
  - Filter by brand reputation/quality score
  - Focus on classic, timeless pieces
  - Material and quality information display
  - Brand authenticity verification
- **Condition of Satisfaction:** 70% of users successfully identify and purchase at least 1 luxury staple item per month
- **Priority:** Should Have
- **Estimate:** 5 story points

**US-LH-2 (Low Fashion/High Budget): Luxury-Affordable Mix Inspiration**
- **As:** Emily, a social media influencer
- **I want:** Outfit ideas mixing luxury and affordable brands
- **So that:** I can create inspiring posts that attract followers
- **Acceptance Criteria:**
  - "Mix & Match" feature combining high/low price items
  - Style inspiration gallery
  - Cost breakdown per outfit
  - "Get the look for less" alternatives
- **Condition of Satisfaction:** Users create and share at least 2 mixed-budget outfits per week
- **Priority:** Could Have
- **Estimate:** 8 story points

**US-LH-3 (Low Fashion/High Budget): Familiar Brand Comfort**
- **As:** Koby, a foreign exchange freshman
- **I want:** To find familiar domestic brands
- **So that:** I can feel comfortable and fit in with peers
- **Acceptance Criteria:**
  - Brand origin/location information
  - Filter by "domestic" vs "international" brands
  - Popular on-campus brands highlighted
  - Cultural style guides
- **Condition of Satisfaction:** 65% of international students successfully find and purchase items from at least 2 familiar brands
- **Priority:** Won't Have (for initial release)
- **Estimate:** 3 story points

#### Low Fashion/Low Budget Persona

**US-LL-1 (Low Fashion/Low Budget): Wardrobe Variety Building**
- **As:** David Kosher, a new freshman
- **I want:** To increase the variety of clothes in my wardrobe
- **So that:** I can be more confident in how I present myself
- **Acceptance Criteria:**
  - Wardrobe diversity analysis
  - Suggestions for missing clothing types
  - Budget-friendly wardrobe expansion plans
  - Style profile questionnaire
- **Condition of Satisfaction:** Users add at least 3 different clothing types to their wardrobe within first month
- **Priority:** Must Have
- **Estimate:** 8 story points

**US-LL-2 (Low Fashion/Low Budget): Fashion Experimentation**
- **As:** Amanda, a student new to fashion
- **I want:** To explore simple, low-cost clothing options
- **So that:** I can experiment with new outfits without financial worry
- **Acceptance Criteria:**
  - "Beginner-friendly" style filter
  - Under $20 item filter
  - Basic outfit combination templates
  - Fashion 101 tips and guides
- **Condition of Satisfaction:** 70% of fashion beginners try at least 5 different outfit combinations in first week
- **Priority:** Should Have
- **Estimate:** 5 story points

**US-LL-3 (Low Fashion/Low Budget): Quick Basic Shopping**
- **As:** Ryan, someone not interested in trends
- **I want:** To quickly find basic, comfortable clothing
- **So that:** I can minimize shopping time and focus on other tasks
- **Acceptance Criteria:**
  - "Basics only" quick-filter option
  - One-click reorder of previous purchases
  - Minimal UI mode
  - Fast checkout process
- **Condition of Satisfaction:** Users complete shopping in under 3 minutes from app open to checkout
- **Priority:** Should Have
- **Estimate:** 3 story points

### Storyboards
#### High Fashion/High Budget

![](assets/PRD/StoryboardHH.png)

#### High Fashion/Low Budget

![](assets/PRD/StoryboardHL.png)

#### Low Fashion/High Budget

![](assets/PRD/StoryboardLH.png)

#### Low Fashion/Low Budget

![](assets/PRD/StoryboardLL.png)


## Technologies

### Platform
- **iOS Native Mobile App** (iPhone, iOS 14+)
- Camera-based AR try-on experience

### Core Technology Stack

**Frontend:**
- Swift/SwiftUI - iOS development
- ARKit - Augmented reality
- AVFoundation - Camera integration
- Core ML - On-device machine learning

**Backend:**
- JavaScript (Node.js + Express) OR Python (Flask) - API server
- MongoDB - Database
- AWS S3 - Image storage
- JWT - Authentication

**AI/ML:**
- Hugging Face SAM Model (`facebook/sam-vit-base`) - Image segmentation
  - URL: https://huggingface.co/facebook/sam-vit-base
- Custom ML model - Fit prediction (architecture TBD)

**Integrations:**
- E-commerce APIs for product data (specific retailers TBD)
- Web scraping for stores without APIs

### Development & Security
- Git/GitHub - Version control
- Encrypted data storage and transmission
- User privacy protection

### Appendex - Mom Test Script & Notes

## Script

Intro Question
1. When was the last time you went to the mall or any clothing store? How far was it?
General Experience/Satisfaction
2. Where did you go and did you buy anything?
3. Are you confident when you buy clothing? How do you decide what to buy?
4. Do you already know what to pick out when you buy something?
5. Was there anything frustrating you when you went to buy clothes? Can you tell me about the experience?
6. Online:  Can you walk me through the last time you bought something online? What are the pros/cons?
7. In-person: Can you walk me through the last time you bought something? Pro/Cons?
8. What are you doing now to deal with that problem?
9. Do you know anyone else that has trouble shopping for clothes? It can be any problem or a problem you have that you both share.
10. Are you satisfied with what you purchased and do you still wear it today? Why/Why not?
11. Have you ever had an emotionally high shopping experience before?
12. Are you a fan of high-end designer stores? If so, how come?
13. Do you keep up with the current fashion trends and new releases?
Clothing Returns
14. Have you ever returned any clothing?
15. Was it online or in person?
16. Do you return items often? Why/Why not?
17. If not, do you still wear it?
Final
18. Is there anything else you would like to share about your clothing expedition experience?

# Justin’s Interview Notes:
Interviewee 1: Qingyu Lin
Undergraduate Student at Berkeley University
Core pain Points:
Difficulty with sizing consistency
Hard to find pants that fit properly - often out of his range from social standards
Online purchases often don’t fit, leading to frequent returns or unused clothing
Returns are annoying and only does it when necessary
Believes society pushes unrealistic “ideal” body sizes that may work for some part of populations, but he isn’t included
Limited inclusivity coverage despite some market improvements.
Frustrated with “Fashion traps”
Emotional Highs:
Usually confident when he buys clothes once it is a good fit
Satisfied when clothes are sustainable, long-lasting, comfortable, and reasonably priced
Sticks with the brands he is familiar with for reliable sizing
Enjoys wandering around stores/thrift shops in his free time
Technology Used
Sizing online tools helps with fit estimates
Checking stock online before arriving in person.
Shopping Habits
Prefers in person instead of online
Using tailored stores to adjust oversized clothing
Open to thrift stores or consignment stores for unique finds.
Fashion not easily influenced by friends/family

Interviewee 2 (Yong Kai)
Undergraduate Alumni that currently work at SalesForce.
Core pain Points:
Not fond of shopping in general (online or in person) due to limited knowledge about fashion
Doesn’t plan purchases and would just browse aimlessly 
Rarely buys online due to return hassles and uncertainty
Prefers to return items in person due to staff interaction
If he forgets to return, clothes often just gather dust in closet
Skeptical of designer brands/luxury clothes since he doesn’t see the value of them
Doesn’t update wardrobe often
Emotional Highs:
Overall very neutral but doesn’t really enjoy shopping
Some enjoyment when influenced by friends during group shopping trips
Social media often gives him a spark of influence but quickly fades away.
Technology Used
TikTok/Pinterest/Instagram
Sometimes they use branded websites to check what they have.
Shopping Habits
Very minimal, as he only buys a few clothes at a time and rarely buys in bulk
Prefers neutral colors since they go with just about everything
Prefers cheaper brands such as Uniqlo, Hollister, etc.
Avoids luxury brands
Avoids small local stores since he is unsure about their quality.
Prefers in-person shopping since he can try them on directly
Short trips when alone, longer trips with friends
Very little or no online shopping.

Interviewee 3: (Nicholas He)
Graduate Student at Georgia Tech University 
Core pain Points:
Few emotional highs when shopping, unless its an exclusive seasonal item or a new release
Material for clothing is very important. Many salesperson lie about material and their characteristics such as cotton and many clothes have shrunk to the point he can’t wear them anymore
Returns are more frequent for online purchases. Would rather return and buy a new one than to go to a tailor shop and waste more money
High end brand shopping is enjoyable, but price and exclusivity is a big factor
Doesn’t experiment much with new clothing trends
Sometimes influenced into buying items if a salesperson spots him looking at a product for too long. 
Emotional Highs:
Excited with new exclusive items or newly released items
Enjoys social outings with friends
Enjoys high end brands and luxury clothes 
Confident when buying in person
Technology Used
TikTok/Pinterest/Instagram or just about any social media platform
Comfortable shopping online due to familiarity with branding sizes
To read about material composition
Check brand offerings online before committing.
Shopping Habits
Prefers in-person shopping, but online will do sometimes
Typically shops for casual/regular/gym wear
Limited experimentation
Somewhat influenced by friends/family
Starting to gravitate to only liking clothes with a popular brand associated with it (Doesn’t have to necessarily be an expensive piece of clothing)

# Edwin Interview Notes
Interviewee #1 (Aaron) notes: 
29 Male
Live around 4-5 miles from the mall 
30 minutes drive, bad traffic (pain point)
Fairly tech savvy
Shops far more online, hasn’t gone to mall in a long time
Usually Amazon (has prime)
Around every other week
Fairly spontaneous shopper
Deciding what to buy
Usually see new clothes from ads
Add stuff to cart and see if wallet can handle it
Cost > comfort > style
Brand isn’t a factor at all
Bad returning experience, rarely returns items (pain point)
Only returns items if necessary
Usually just keep the clothes
wear for workouts if it’s really bad

Edwin interviewee #2 (Ali) notes:
27 Male
Lives 30 minutes drive away from mall
Not very tech savvy
Shops online very often
Most recent online clothes purchase: Levi’s jeans
Went to shop for clothes in person last time around 2 months ago
More carefully planned shopper
Very annoying return experience
Tries to avoid returning altogether, plan out purchases more
Would almost rather shop in person instead  (pain point)
But still would more likely to return online purchases than in person purchases
Deciding what to buy
Cost = comfort >> style
Brand matters: sticks to the brands he already has

Edwin Interviewee #3 (Ethan) notes:
25 Male
Lives ~5 minutes walk from mall
Very tech savvy
Very spontaneous in shopping online
Clothes purchases
Vast majority of the time buy from in person
Because hard to tell if it looks good on them online  (pain point)
For all other purchases (non clothes)
Usually buy from online, regularly uses Amazon
Overall 90% of purchases online and 10% purchases in person
Return experience
Bad experiences with return
Instead of returning:
Keep it if it’s only slightly worse than expected
Buy something else to match with this bad purchase  (pain point)
Deciding what to buy
Style > comfort > cost
Brand does not matter at all in decision

# Daiki’s Customer Interview Notes - Virtual Try-On App
Name: Daiki
 Date: 2025-10-01
 Project: AI-Powered Virtual Try-On for Online Clothing Shopping

Interview Summary
We interviewed 3 participants about their online clothing shopping experiences.
Two out of three people never return clothes they buy online, even when they don't fit.

Interview #1: Ashley
Participant Info
Female, 23 years old, a former northeastern student, and an elementary school teacher. 
Buys mostly second-hand clothes
Environmentally conscious
Questions & Answers
Q: When was the last time you went to the mall?
Last mall visit: August 30, 2025
Last clothing purchase at the mall: Mid-August 2025
Q: Tell me about the last time you returned an online clothing purchase.
"I have actually never returned something I bought online."
Instead, she resells items or gives them to friends
Key insight: She avoids returns completely
Q: Is there anything that frustrates you when buying online?
"Yes!!!" - Very frustrated with the fast fashion industry
Feels pressured by trends but wants comfort
Concerned about sustainability
Q: How do you decide what clothes to buy? Priority order:
Fit - "If something doesn't fit, it isn't comfortable."
Comfort
Brand ethics
Known brands where she knows her size
Q: Walk me through the last time you bought something online.
"I sometimes spend weeks looking at options"
Only buys with a "legit reason" or when she gets a coupon
Very deliberate purchasing process
Q: Do you return items often? Why or why not?
"No."
Only buys from brands where she knows her size
Or buys second-hand with measurements provided
"Returning items is not sustainable because many places discard returns" 
Q: What are you doing now to deal with that problem?
"I spend hours looking for the best items. Which is probably not the best solution either." 
Admits her current solution isn't good
Key Takeaways - Ashley
 Never returns online purchases
 Spends hours/weeks researching before buying
 Environmental guilt prevents returns
 Fit is #1 priority
 Current solution (hours of research) is inadequate

Interview #2: Daniel
Participant Info
18 years old
Biology major, Northeastern University
Bay Area
Primarily an online shopper
Questions & Answers
Q: Do you mainly buy clothes online?
Yes
Q: When was the last time you returned something?
"A few months ago"
Q: What is your experience with buying clothes online?
"Buying clothes online is smooth, but the return process is so frustrating." 
Clear contrast: buying = good, returns = bad
Q: What makes returns frustrating?
"There are too many steps and forms to fill in, especially for large stores."
Q: Do you know anyone else with this problem?
"My friend also struggles with the same problem"
Key Takeaways - Daniel
Returns are "so frustrating"
Too many steps and forms
Worse at large stores
Friend has the same problem
Missing info: We didn't ask enough follow-up questions about his specific return experience

Interview #3: Ashwin
Participant Info
24 years old
PhD student, Electrical Engineering
From India
Goes to the mall often
Questions & Answers
Q: What problems do you encounter when buying clothes online?
"Not fitting"
"Quality of the product"
Q: Are you aware of the return process?
"Know that returning the product is uncomfortable."
Q: Tell me more about returns.
"Headache many steps to return" 
"Emotionally, you don't want to be the guy who gets free products" 
 Key insight: Social guilt/shame about returns
Q: Have you ever returned clothes?
"No return for clothes"
But has returned shoes for a discount
Key Takeaways - Ashwin
Never returns clothes
 Fit and quality are problems
 Returns = "headache" and "uncomfortable"
 Social/emotional guilt: doesn't want to seem like he's getting free products
 Has returned shoes but not clothes
Missing info: We didn't ask what he does with clothes that don't fit

Overall Findings
Main Patterns
1. Return Avoidance (2 out of 3 never return clothes)
Ashley: Never - resells or gives away instead
Daniel: Yes but very frustrated
Ashwin: Never - keeps ill-fitting clothes
2. Fit is #1 Priority (All 3 mentioned)
Everyone said fit is their biggest concern
3. Emotional Barriers to Returns
Environmental guilt (Ashley)
Social shame (Ashwin)
Frustration with process (Daniel, Ashwin)
4. Current Solutions Don't Work
Ashley: Spends hours/weeks researching
Daniel: Accepts frustration
Ashwin: Keeps clothes that don't fit

## AI Assistance Note

**Team Contributions:**
All customer interviews, user research, personas, journey mapping, storyboards, and strategic decisions were completed by Justin, Daiki, and Edwin. AI-generated content was reviewed and edited by our team.

**Tool Used:** Claude (Anthropic) - Sonnet 4.5

**Usage:**
- User Stories formatting (INVEST+E format with MoSCoW prioritization)
- Requirements structuring and organization  
- Technical specifications formatting

**Key Prompts:**
- "Explain and help format user stories into INVEST+E format with MoSCoW prioritization"
- "Review PRD against rubric requirements and identify gaps"

**Date:** October 8, 2025
