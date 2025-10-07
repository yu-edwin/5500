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

## Success Metrics

1.1 There should be an app made for iOS devices (essential)

1.2 The user is able to use the camera in the app (essential)

1.3 The user should be able to record and capture how they look in the app (essential)

1.4 The clothing item can be successfully shown on top of the camera view (essential)

2.1 The user can give the link to a clothing item (essential)

2.2 The link can be accessed and stored on the app (essential)

2.3 The images for the clothing item can be shown on the app (essential)

2.4 The user should be able to keep track of their clothes on the app (essential)

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

### Non-functional

### Ethical

Never store images/measurements without consent from the user
Will collect only the necessary data required for app to function
Users should be able to delete their images/data anytime
Bias free (No one should have restricted access based on ethnicity/demographics)
No images generated should be harmful for the user
Encryption will store sensitive data (username/password) for users
Avoid unrealistic images that may result in a negative reaction from user (body morphing)
Will not include a social media aspect that may induce social anxiety or body shaming
Will support all genders identities
Age appropriate regulation


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

After conducting the interviews, I decided to split my personas into 4 categories distinguished by how much emphasis they put into fashion and how much of a budget they are willing to spend. The first aspect is very self explanatory as an individual with high fashion sense would likely value fashion much more than a person with low fashion sense in which they would likely not have put too much thought in what they wear as long as it’s comfortable and works. The other category of budget can be a bit trickier. Some people prefer luxurious products such as Gucci, Louis Vuitton, etc and won’t mind spending extra for designer brand names. However, most people would likely not be willing to afford such luxurious items, but still recognize brands such as American Eagle, Hollister, Uniqlo, and etc, which places them in the neutral point. Individuals who value spending less for clothes are categorized in the low budget criteria . 
I decided on these two aspects to divide up my persona map into four quadrants since each person in their respective quadrants likely live different lifestyles since they have different values/mindset that influences the clothes that they choose. These people can be categorized as such: 

### User Personas

High Fashion/High Budget:
These people are likely more carefree and outgoing people who believe that the clothes/fashion of people help define who they are. They would be the people who would keep up with the latest fashion trends and know when new items are being released.
![Preview](assets/PRD/PersonaHH.png)

High Fashion/Low Budget:
Individuals who likely enjoy finding a creative/original outfit that doesn’t necessarily include items with expensive logos/names. They might favor small local clothing shops and shop in outlets for potentially cheaper prices.
![Preview](assets/PRD/PersonaHL.png)

Low Fashion/High Budget
These people don’t necessarily care about fashion trends or styles but rather feel more confident in the value of a brand association/more luxurious clothes. 
![Preview](assets/PRD/PersonaLH.png)

Low Fashion/Low Budget:
These people don’t care about their fashion choices, but wear clothes that are more comfortable and sustainable for their everyday life. They could be curious about new fashion trends and might want to change their wardrobe, but are uncertain on how to achieve that.
![Preview](assets/PRD/PersonaLL.png)

## Tasks

### Journy Mapping

![Preview](assets/PRD/JourneyMapping.png)

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
![Preview](assets/PRD/StoryboardHH.png)
#### High Fashion/Low Budget
![Preview](assets/PRD/StoryboardHL.png)
#### Low Fashion/High Budget
![Preview](assets/PRD/StoryboardLH.png)
#### Low Fashion/Low Budget
![Preview](assets/PRD/StoryboardLL.png)


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
