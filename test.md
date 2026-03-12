# Migration Execution Plan & Output

> **Generated:** 12 March 2026  
> **Tool:** Franklin Converter Tool  
> **Reference:** `knowledge-base.md` (v2.0, 8 components)

---

## 1. Source Inventory

| # | Source File | URL | Lines | Status |
|---|------------|-----|-------|--------|
| 1 | `extracted/pfizer-co-za.html` | https://www.pfizer.co.za/ | 960 | ✅ Extracted |
| 2 | `extracted/pfizer-com.html` | https://www.pfizer.com/ | 1896 | ✅ Extracted |

---

## 2. Destination Component Reference (AF_Components)

| # | Component | Reference Files | Table Layout | KB Section |
|---|-----------|----------------|--------------|------------|
| 1 | Corporate Primary Menu | `sidekick.md`, `structure.json`, `example.html` | Labeled (brand, nav, utilities, contact-us) | §1 |
| 2 | Corporate Hero | `sidekick.md`, `structure.json`, `example.html` | Labeled (image, heading, body) | §2 |
| 3 | Corporate Card | `sidekick.md`, `structure.json`, `example.html` | Labeled (image, header, body, footer, link) | §3 |
| 4 | Corporate Carousel | `sidekick.md`, `structure.json`, `example.html` | Dual-Cell Repeatable (image &#124; heading+body) | §4 |
| 5 | Corporate Feature | `sidekick.md`, `structure.json`, `example.html` | Labeled (image, body) | §5 |
| 6 | Corporate Accordion | `sidekick.md`, `structure.json`, `example.html` | Dual-Cell Repeatable (heading &#124; body) | §6 |
| 7 | Corporate Tabs | `sidekick.md`, `structure.json`, `example.html` | Dual-Cell Repeatable (label &#124; content) | §7 |
| 8 | Corporate Footer | `sidekick.md`, `structure.json`, `example.html` | Labeled (logo, nav×3, copyright, socials) | §8 |
| 9 | Paragraph (fallback) | N/A — plain Markdown | No table — headings, text, images, links | §9.10 |

---

## 3. Source-to-Destination Component Mapping

### 3.1 pfizer-co-za.html → Component Mapping

| Sec# | HTML Source Element | Detected Pattern | Matched Component | Variant | Confidence |
|------|-------------------|------------------|-------------------|---------|------------|
| 1 | `<corporate-primary-menu>` with `white-menu-background` class | Nav bar with logo, nested nav links, contact-us button | **Corporate Primary Menu** | `white` (default) | ✅ High — tag confirmed |
| 2 | `<corporate-hero>` with CSS background image + H1 | Full-width banner, CSS bg image, centered H1 | **Corporate Hero** | `align-center` | ✅ High — tag confirmed |
| 3 | `<helix-core-image>` with AboutM.jpg + category + H4 heading + CTA + link list | Image stacked above heading + body + links (vertical card layout) | **Corporate Card** | `showtext` | ⚡ Medium — visual pattern matches card |
| 4 | `<helix-core-heading>` H5 "Pfizer South Africa" + 3 paragraphs | Standalone heading + multiple body paragraphs, no component wrapper | **Paragraph** (fallback) | — | ✅ High — plain content |
| 5 | `<corporate-feature>` with CommunitiesM.jpg + "Careers" heading + body + CTA | Two-column: image left, text right | **Corporate Feature** | `image-left` (default) | ✅ High — tag confirmed |
| 6 | `<corporate-footer>` with logo, 3 nav lists, long copyright, 5 social links | Footer with logo, nav columns, copyright, social icons | **Corporate Footer** | `copyright-long` | ✅ High — tag confirmed |

### 3.2 pfizer-com.html → Component Mapping

| Sec# | HTML Source Element | Detected Pattern | Matched Component | Variant | Confidence |
|------|-------------------|------------------|-------------------|---------|------------|
| 1 | `<header>` with `<nav>`, logo, `main-menu__list`, utilities, contact-us | Nav header, logo → `/`, multi-level nav (3 levels), utility links, Contact Us | **Corporate Primary Menu** | `white` (default) | ✅ High — visual pattern |
| 2 | `div.banner-section` with `<picture>` banner + H1 "SCIENCE WILL WIN" + body + CTA | Full-width hero banner, large image, H1, body text, CTA | **Corporate Hero** | `dark` | ✅ High — visual pattern |
| 3 | `div.two-column` with YouTube video thumbnail + H4 "Early Detection is Key" + CTA | Two-column: video/image left, text right | **Corporate Feature** | `image-left` | ⚡ Medium — video thumbnail as image |
| 4 | `div.view-reference-default` with H2 "Latest Articles" + 5 article links | Article listing — dynamic content with dates | **Paragraph** (fallback) | — | ✅ High — no matching component |
| 5 | `div.two-column` with image left + H4 "Pfizer Announces New Discount Program" + CTA | Two-column: image left, text right | **Corporate Feature** | `image-left` | ✅ High — classic side-by-side |
| 6 | `div.section-dark` with H3 "Products" + search form + H3 "RxPathways" + CTA | Dark section with product search form + text tile | **Paragraph** (fallback) | — | ✅ High — search form |
| 7 | `section.pipeline-infographic` with pipeline counts + GIF + CTAs | Pipeline snapshot infographic with animated GIF | **Paragraph** (fallback) | — | ✅ High — unique infographic |
| 8 | `div.areas-focus__container` with `swiper-container`, 4 slides with images + H5 | 4 card items in horizontal swiper/slider with prev/next nav | **Corporate Carousel** | `col-4`, `show-nav`, `box-shadow` | ✅ High — swiper pattern |
| 9 | `section.text-tile` with H2 "About" + H4 heading + CTA | Standalone text tile | **Paragraph** (fallback) | — | ✅ High — text-only |
| 10 | `div.twocolumn-links-tile` with image right + H4 heading + CTA in `section-light` | Two-column: text left, image right, light background | **Corporate Feature** | `image-right`, `light` | ✅ High |
| 11 | `section.text-tile` in `section-dark` with H3 "Sign Up" + body + CTA | Dark text tile | **Paragraph** (fallback) | — | ✅ High — text-only |
| 12 | `<footer>` with logo, 3 nav columns, copyright, social icons | Standard footer pattern | **Corporate Footer** | `copyright-long` | ✅ High — `<footer>` tag |

---

## 4. Migration Summary

### 4.1 Component Usage Across Both Pages

| Component | pfizer-co-za | pfizer-com | Total |
|-----------|:------------:|:----------:|:-----:|
| Corporate Primary Menu | 1 | 1 | **2** |
| Corporate Hero | 1 | 1 | **2** |
| Corporate Card | 1 | 0 | **1** |
| Corporate Carousel | 0 | 1 | **1** |
| Corporate Feature | 1 | 3 | **4** |
| Corporate Accordion | 0 | 0 | **0** |
| Corporate Tabs | 0 | 0 | **0** |
| Corporate Footer | 1 | 1 | **2** |
| Paragraph (fallback) | 1 | 5 | **6** |
| **Total sections** | **6** | **12** | **18** |

### 4.2 Unmapped Components

| Component | Reason |
|-----------|--------|
| Corporate Accordion | No expandable/collapsible panels found in either source |
| Corporate Tabs | No tabbed interfaces found in either source |

---

## 5. Migrated Output

Below is the combined Franklin grid-table output for both source pages. Each component table is rendered in standard Markdown for preview compatibility.

---

---

# PAGE 1: pfizer-co-za.html

> **Source:** https://www.pfizer.co.za/

---

### Section 1 — Corporate Primary Menu

| **Corporate Primary Menu** | |
|---|---|
| **brand** | [![Pfizer](https://www.pfizer.com/profiles/pfecpfizercomus_profile/themes/pfecpfizercomus/public/assets/images/logo-blue.svg)](/) |
| **nav** | - [About Us](/about) |
| | &nbsp;&nbsp;- [Our History](/about/our-history) |
| | &nbsp;&nbsp;- [Our Values](/about/our-values) |
| | &nbsp;&nbsp;- [Our Products](/about/our-products) |
| | - [Careers](/careers) |
| | - [Therapeutic Areas](/therapeutic-areas) |
| **contact-us** | [Contact Us](/contact) |

---

### Section 2 — Corporate Hero (align-center)

| **Corporate Hero (align-center)** | |
|---|---|
| **image** | ![](https://www.pfizer.co.za/images/05a86639e81951b3b72a0c6b00102a06.png) |
| **heading** | **Breakthroughs That Change Patients' Lives** *(H1)* |

---

### Section 3 — Corporate Card (showtext)

| **Corporate Card (showtext)** | |
|---|---|
| **image** | ![Helix Image](https://www.pfizer.co.za/images/custom/AboutM.jpg) |
| **header** | **Biotechnology is our foundation. Lorem ipsum dolor sit amet.** *(H5)* |
| *(body)* | Category |
| *(body)* | [Explore Our Science](/science) |
| *(body)* | - [Oncology](#) |
| *(body)* | - [Inflammation & Immunology](#) |
| *(body)* | - [Vaccines](#) |
| *(body)* | - [Rare Disease](#) |

---

### Section 4 — Paragraph (fallback)

> **No component table** — rendered as plain Markdown

**Pfizer South Africa** *(H5)*

At Pfizer, we apply science and our global resources to bring therapies to people that extend and significantly improve their lives. We strive to set the standard for quality, safety and value in the discovery, development and manufacture of health care products, including innovative medicines and vaccines. Every day, Pfizer colleagues work across developed and emerging markets to advance wellness, prevention, treatments and cures that challenge the most feared diseases of our time. Consistent with our responsibility as one of the world's premier innovative companies, we collaborate with health care providers, governments and local communities to support and expand access to reliable, affordable health care around the world. For more than 150 years, we have worked to make a difference for all who rely on us.

From our sub-Saharan Africa headquarters located in Johannesburg, South Africa, for more than 70 years, Pfizer has been delivering life-changing breakthroughs to the people of South Africa. Guided by our three pillars of innovation, investing and safeguarding, we work with Healthcare Practitioners, Policy Makers, Patient Groups and other members of civil society to serve the communities in which we live and work, broadening access to medicines and strengthening healthcare delivery for the people who need it most.

Living our values of courage, excellence, equity and joy, we are a diverse team of about 250 people working daily to provide all South Africans with access to global scientific innovation that can help them to live longer, better lives. Through our commitment to the national agenda, we are contributing to the development of a strong healthcare system, as well as growth of the knowledge economy in the interest of those who need to be empowered today and to the benefit of the generations to come.

---

### Section 5 — Corporate Feature

| **Corporate Feature** | |
|---|---|
| **image** | ![](https://www.pfizer.co.za/images/custom/CommunitiesM.jpg) |
| **body** | Join the pfizer team |
| | **Careers** *(H4)* |
| | Step inside the world of Pfizer and you'll discover that every single person who works here plays an essential part in making breakthroughs that change patients' lives. |
| | [Learn More](/careers) |

---

### Section 6 — Corporate Footer (copyright-long)

| **Corporate Footer (copyright-long)** | |
|---|---|
| **logo** | [![Pfizer logo](https://www.pfizer.co.za/images/9b08862f235a19554d3ac1adba05f4e7.svg)](/) |
| **nav** (col 1) | - [Home](/) |
| | - [About Us](/about) |
| **nav** (col 2) | - [News](/news) |
| | - [Careers](/careers) |
| | - [Contact](/contact) |
| | - [Pfizer Global](https://www.pfizer.com/) |
| **nav** (col 3) | - [Terms of use](/terms) |
| | - [Privacy Policy](/privacy) |
| | - [Disclaimer](/disclaimer) |
| | - [PAIA](https://www.pfizer.co.za/files/Pfizer-PAIA-Manual.pdf) |
| **copyright** | Pfizer Laboratories (Pty) Ltd. Company Reg. No. 1954/000781/07. Building 2, 1st Floor, Maxwell Office Park, Magwa Crescent, Waterfall City, Midrand, Johannesburg, South Africa. Tel. No: 0860 PFIZER (734937). Copyright © 2025. Pfizer Laboratories (Pty) Ltd. All rights reserved. [Contact Us](/contact) · [Privacy Policy](/privacy) · [PAIA](https://www.pfizer.co.za/files/Pfizer-PAIA-Manual.pdf) · [Terms of use](/terms) |
| **socials** | - [Twitter](https://twitter.com/Pfizer) |
| | - [Facebook](https://facebook.com/Pfizer) |
| | - [LinkedIn](https://www.linkedin.com/company/pfizer) |
| | - [Instagram](https://instagram.com/Pfizer) |
| | - [YouTube](https://youtube.com/Pfizer) |

---

---

# PAGE 2: pfizer-com.html

> **Source:** https://www.pfizer.com/

---

### Section 1 — Corporate Primary Menu

| **Corporate Primary Menu** | |
|---|---|
| **brand** | [![Pfizer logo](https://www.pfizer.com/profiles/pfecpfizercomus_profile/themes/pfecpfizercomus/public/assets/images/logo-blue.svg)](/) |
| **nav** | - [Science](/science) |
| | &nbsp;&nbsp;- [Clinical Trials](#) |
| | &nbsp;&nbsp;&nbsp;&nbsp;- [Guide to Clinical Trials](/science/clinical-trials/guide) |
| | &nbsp;&nbsp;&nbsp;&nbsp;- [Clinical Trials in Children](/science/clinical-trials/children) |
| | &nbsp;&nbsp;&nbsp;&nbsp;- [Data and Results](/science/clinical-trials/data-and-results) |
| | &nbsp;&nbsp;&nbsp;&nbsp;- [Integrity and Transparency](/science/clinical-trials/integrity-and-transparency) |
| | &nbsp;&nbsp;&nbsp;&nbsp;- [Diversity](/science/clinical-trials/diversity) |
| | &nbsp;&nbsp;&nbsp;&nbsp;- [Plain Language Study Results](/science/clinical-trials/plain-language-study-results-summaries) |
| | &nbsp;&nbsp;&nbsp;&nbsp;- [Expanded Access & Compassionate Use](/science/clinical-trials/expanded-access) |
| | &nbsp;&nbsp;- [Find a Trial](https://www.pfizerclinicaltrials.com/find-a-trial?cmp=7f98a514-640b-48fa-8228-6f68ef3bc84e&ttype=BA) |
| | &nbsp;&nbsp;- [Areas of Focus](#) |
| | &nbsp;&nbsp;&nbsp;&nbsp;- [Internal Medicine](/science/focus-areas/internal-medicine) |
| | &nbsp;&nbsp;&nbsp;&nbsp;- [Inflammation & Immunology](/science/focus-areas/immunology-inflammation) |
| | &nbsp;&nbsp;&nbsp;&nbsp;- [Vaccines](/science/focus-areas/vaccines) |
| | &nbsp;&nbsp;&nbsp;&nbsp;- [Oncology](/science/focus-areas/oncology) |
| | &nbsp;&nbsp;- [Diseases & Conditions](/science/disease-and-conditions-index) |
| | &nbsp;&nbsp;- [Product Pipeline](/science/drug-product-pipeline) |
| | &nbsp;&nbsp;- [Research Sites](/science/centers) |
| | - [Products](/products) |
| | &nbsp;&nbsp;- [How Drugs are Made](#) |
| | &nbsp;&nbsp;&nbsp;&nbsp;- [Branded vs. Generic](/products/how-drugs-are-made/branded-versus-generics) |
| | &nbsp;&nbsp;&nbsp;&nbsp;- [Biologics & Biosimilars](/products/how-drugs-are-made/biologics-and-biosimilars) |
| | &nbsp;&nbsp;&nbsp;&nbsp;- [Commitment to Quality](/products/how-drugs-are-made/commitment-to-quality) |
| | &nbsp;&nbsp;&nbsp;&nbsp;- [Global Supply](/products/how-drugs-are-made/global-supply) |
| | &nbsp;&nbsp;&nbsp;&nbsp;- [Manufacturing Sites](/products/how-drugs-are-made/manufacturing-sites) |
| | &nbsp;&nbsp;- [Medicine Safety](#) |
| | &nbsp;&nbsp;&nbsp;&nbsp;- [Health Literacy](/products/medicine-safety/health-literacy) |
| | &nbsp;&nbsp;&nbsp;&nbsp;- [Treatment Choices](/products/medicine-safety/treatment-choices) |
| | &nbsp;&nbsp;&nbsp;&nbsp;- [Partnering With Patients](/products/medicine-safety/partnering-with-patients) |
| | &nbsp;&nbsp;&nbsp;&nbsp;- [Tips for Patients](/products/medicine-safety/tips) |
| | &nbsp;&nbsp;&nbsp;&nbsp;- [Reporting Adverse Events](/products/medicine-safety/reporting) |
| | &nbsp;&nbsp;&nbsp;&nbsp;- [Counterfeiting](/products/medicine-safety/counterfeiting) |
| | &nbsp;&nbsp;&nbsp;&nbsp;- [Product Safety](/products/medicine-safety/data-sheets) |
| | &nbsp;&nbsp;- [Product List](/products/product-list) |
| | &nbsp;&nbsp;- [Product Contacts](/products/information) |
| | &nbsp;&nbsp;- [PfizerForAll](https://www.pfizerforall.com/) |
| | &nbsp;&nbsp;- [PfizerPro for Professionals](https://www.pfizerpro.com) |
| | &nbsp;&nbsp;- [Patient Assistance Programs](https://www.pfizerrxpathways.com) |
| | &nbsp;&nbsp;- [Distributors](#) |
| | &nbsp;&nbsp;&nbsp;&nbsp;- [Pfizer Distributors](/products/medicine-distributors/pfizer) |
| | - [Stories](/stories) |
| | &nbsp;&nbsp;- [Articles](/stories/articles) |
| | &nbsp;&nbsp;- [Announcements](/stories/announcements) |
| | &nbsp;&nbsp;- [Behind the Science Features](/stories/behind-the-science) |
| | &nbsp;&nbsp;- [Podcasts](/stories/podcasts) |
| | &nbsp;&nbsp;- [eBooks](/stories#ebooks-section) |
| | - [Newsroom](/newsroom) |
| | &nbsp;&nbsp;- [Press Releases](/newsroom/press-releases) |
| | &nbsp;&nbsp;- [Media Asset Library](/newsroom/media-assets) |
| | &nbsp;&nbsp;- [Updates and Statements](/newsroom/updates-and-statements) |
| | &nbsp;&nbsp;- [Partnering News](/newsroom/partnering-news) |
| | &nbsp;&nbsp;- [Media Contacts](/newsroom/pfizer-media-relation) |
| | - [About](/about) |
| | &nbsp;&nbsp;- [People](#) |
| | &nbsp;&nbsp;&nbsp;&nbsp;- [Executives](/about/people/executives) |
| | &nbsp;&nbsp;&nbsp;&nbsp;- [Board Members](/about/people/board-members) |
| | &nbsp;&nbsp;&nbsp;&nbsp;- [Scientist Stories](/about/people/scientists) |
| | &nbsp;&nbsp;&nbsp;&nbsp;- [Patient Stories](/about/people/patients) |
| | &nbsp;&nbsp;&nbsp;&nbsp;- [Colleague Stories](/about/people/colleagues) |
| | &nbsp;&nbsp;- [Responsibility](#) |
| | &nbsp;&nbsp;&nbsp;&nbsp;- [Ethics & Compliance](/about/responsibility/compliance) |
| | &nbsp;&nbsp;&nbsp;&nbsp;- [Responsible Business](/about/responsibility/responsible-business) |
| | &nbsp;&nbsp;&nbsp;&nbsp;- [Patient Advocacy & Engagement](/about/responsibility/patient-advocacy-engagement-putting-patients-first) |
| | &nbsp;&nbsp;&nbsp;&nbsp;- [Global Impact](/about/responsibility/global-impact) |
| | &nbsp;&nbsp;&nbsp;&nbsp;- [Diversity, Equity, and Inclusion](/about/responsibility/diversity-and-inclusion) |
| | &nbsp;&nbsp;&nbsp;&nbsp;- [Environmental Sustainability](/about/responsibility/environmental-sustainability) |
| | &nbsp;&nbsp;&nbsp;&nbsp;- [Human Rights](/about/responsibility/human-rights) |
| | &nbsp;&nbsp;&nbsp;&nbsp;- [Health & Safety](/about/responsibility/health-safety) |
| | &nbsp;&nbsp;&nbsp;&nbsp;- [Intellectual Property](/about/responsibility/intellectual-property) |
| | &nbsp;&nbsp;&nbsp;&nbsp;- [EHS Governance](/about/responsibility/ehs-governance) |
| | &nbsp;&nbsp;&nbsp;&nbsp;- [Misinformation](/about/responsibility/misinformation) |
| | &nbsp;&nbsp;&nbsp;&nbsp;- [Antimicrobial Resistance](/about/responsibility/antimicrobial-resistance) |
| | &nbsp;&nbsp;&nbsp;&nbsp;- [Animals Used in Research](/about/responsibility/animals-used-in-research) |
| | &nbsp;&nbsp;&nbsp;&nbsp;- [Stem Cell Research Policy](/about/responsibility/stem-cell-research) |
| | &nbsp;&nbsp;- [Programs & Policies](#) |
| | &nbsp;&nbsp;&nbsp;&nbsp;- [Grants](/about/programs-policies/grants) |
| | &nbsp;&nbsp;&nbsp;&nbsp;- [Political Partnership](/about/programs-policies/political-partnerships) |
| | &nbsp;&nbsp;&nbsp;&nbsp;- [Working with Healthcare Professionals](/about/programs-policies/working-with-healthcare-professionals) |
| | &nbsp;&nbsp;&nbsp;&nbsp;- [Prescription Value & Pricing](/about/programs-policies/prescription-pricing-and-value) |
| | &nbsp;&nbsp;&nbsp;&nbsp;- [Privacy Principles](/about/programs-policies/privacy-principles) |
| | &nbsp;&nbsp;&nbsp;&nbsp;- [Ready for Cures](/about/programs-policies/ready-for-cures) |
| | &nbsp;&nbsp;&nbsp;&nbsp;- [Transparency in Grants](/about/programs-policies/transparency-in-grants) |
| | &nbsp;&nbsp;&nbsp;&nbsp;- [Policy Positions](/about/programs-policies/policy-positions) |
| | &nbsp;&nbsp;- [Investors](https://investors.pfizer.com/) |
| | &nbsp;&nbsp;&nbsp;&nbsp;- [Investors Overview](https://investors.pfizer.com/investors-overview/default.aspx) |
| | &nbsp;&nbsp;&nbsp;&nbsp;- [Why Invest](https://investors.pfizer.com/why-invest-our-story/default.aspx) |
| | &nbsp;&nbsp;&nbsp;&nbsp;- [Events & Presentations](https://investors.pfizer.com/events-and-presentations/default.aspx) |
| | &nbsp;&nbsp;&nbsp;&nbsp;- [Financial Reports](https://investors.pfizer.com/financials/quarterly-reports/default.aspx) |
| | &nbsp;&nbsp;&nbsp;&nbsp;- [Investor News](https://investors.pfizer.com/investor-news/default.aspx) |
| | &nbsp;&nbsp;&nbsp;&nbsp;- [Stock Information](https://investors.pfizer.com/stock-information/historical-stock-chart-and-data/default.aspx) |
| | &nbsp;&nbsp;&nbsp;&nbsp;- [Shareholder Services](https://investors.pfizer.com/shareholder-services/default.aspx) |
| | &nbsp;&nbsp;- [Corporate Governance](#) |
| | &nbsp;&nbsp;&nbsp;&nbsp;- [Corporate Governance Overview](https://investors.pfizer.com/corporate-governance/default.aspx) |
| | &nbsp;&nbsp;&nbsp;&nbsp;- [Board Committees & Charters](https://investors.pfizer.com/corporate-governance/board-committees-and-charters/default.aspx) |
| | &nbsp;&nbsp;&nbsp;&nbsp;- [The Pfizer Board Policies](https://investors.pfizer.com/corporate-governance/the-pfizer-board-policies/default.aspx) |
| | &nbsp;&nbsp;&nbsp;&nbsp;- [Corporate Governance FAQs](https://investors.pfizer.com/corporate-governance/corporate-governance-faqs/default.aspx) |
| | &nbsp;&nbsp;&nbsp;&nbsp;- [Contact Our Directors](https://investors.pfizer.com/corporate-governance/contact-our-directors/default.aspx) |
| | &nbsp;&nbsp;- [Purpose](/about/purpose) |
| | &nbsp;&nbsp;- [History](/about/history) |
| | &nbsp;&nbsp;- [Careers](/about/careers) |
| | &nbsp;&nbsp;- [Partners](#) |
| | &nbsp;&nbsp;&nbsp;&nbsp;- [Research and Business Development Partnerships](/about/partners) |
| | &nbsp;&nbsp;&nbsp;&nbsp;- [Venture Investments](/about/partners/venture-investments) |
| | &nbsp;&nbsp;&nbsp;&nbsp;- [Business to Business](/about/partners/B2B-and-suppliers) |
| | &nbsp;&nbsp;&nbsp;&nbsp;- [Pfizer CentreOne](/about/partners/pfizer-centreone) |
| | &nbsp;&nbsp;&nbsp;&nbsp;- [Pfizer Ignite](/about/partners/pfizer-ignite) |
| | &nbsp;&nbsp;&nbsp;&nbsp;- [Submit Your Opportunities](/about/partners/submit-your-opportunities) |
| **utilities** | - [Careers](/about/careers) |
| | - [Investors](https://investors.pfizer.com/) |
| **contact-us** | [Contact Us](/contact) |

---

### Section 2 — Corporate Hero (dark)

| **Corporate Hero (dark)** | |
|---|---|
| **image** | ![](https://cdn.pfizer.com/pfizercom/2026-03/banner_section/ScienceWillWin-Podcast-HomepageBanner-1920x710.png?VersionId=i7Km2VubpwbZaB0c5MdRmWhK35NEPQ9R) |
| **heading** | **SCIENCE WILL WIN** *(H1)* |
| *(body)* | Pfizer's flagship podcast returns to dive into the latest in oncology: the latest challenges, the latest research, the latest treatment approaches, and the latest sources of progress and optimism keeping researchers going. |
| *(body)* | [Listen here](/stories/podcasts/science-will-win/?=HP_banner_promo_swws6) |

---

### Section 3 — Corporate Feature

| **Corporate Feature** | |
|---|---|
| **image** | ![Watch Pfizer Every Breakthrough Matters](https://i.ytimg.com/vi/BVGwtvPz9KI/sddefault.jpg) |
| **body** | **Early Detection is Key** *(H4)* |
| | In the fight against cancer, every screening, every result, every early detection matters. Join the fight against cancer and get screened at PfizerForAll.com/Screenings. |
| | [Get started](https://www.pfizerforall.com/find-care/cancer-screening/?=HP_tile_promo_wcd) |

---

### Section 4 — Paragraph (fallback): Latest Articles

> **No component table** — rendered as plain Markdown

**Latest Articles** *(H2 eyebrow)*

| Date | Type | Article |
|------|------|---------|
| 03.11.2026 | Article | [One Pediatric Gastroenterologist's Mission to Expand Pediatric Treatment Options](/news/articles/one_pediatric_gastroenterologist_s_mission_to_expand_pediatric_treatment_options) |
| 03.10.2026 | Article | [Self-Care for Caregivers](/news/announcements/self-care-caregivers) |
| 03.04.2026 | Article | [February Social Media Round-Up—World Cancer Day, Science Will Win, and More](/news/announcements/february-social-media-round-world-cancer-day-science-will-win-and-more) |
| 03.02.2026 | Article | [How Innovative Diagnostics Are Supporting a Potential Approach to C. difficile](/news/articles/how_innovative_diagnostics_are_supporting_a_potential_approach_c_difficile) |
| 02.19.2026 | Article | [The 6th Season of 'Science Will Win' Takes on Cancer](/news/announcements/6th-season-science-will-win-takes-cancer) |

---

### Section 5 — Corporate Feature

| **Corporate Feature** | |
|---|---|
| **image** | ![Mother showing daughter photos on her phone](https://cdn.pfizer.com/pfizercom/2026-02/GettyImages-1600903279_600X450_opt.jpg?VersionId=HjeJqhIkescFK33N8SzTggU_3sP5G6OI) |
| **body** | **Pfizer Announces New Discount Program Through TrumpRx** *(H4)* |
| | Americans who chose to self-pay can now access significant savings on list prices for 30+ Pfizer brands across women's health, migraine, arthritis, rare diseases, and more. |
| | [Learn more](/news/press-release/press-release-detail/pfizer-launches-cost-savings-program-trumprx-lowering-drug?=HP_tile_promo_trumprx) |

---

### Section 6 — Paragraph (fallback): Products & RxPathways

> **No component table** — rendered as plain Markdown (contains search form)

**Products** *(H3)*

Every product is the result of 1,500 scientists overseeing more than 500,000 lab tests and over 36 clinical trials before the first prescription.

[Browse All Products](/products)

**Pfizer RxPathways** *(H3)*

Pfizer RxPathways connects eligible patients to a range of assistance programs that offer insurance support, co-pay help, and medicines for free or at a savings.

[Explore RxPathways](https://www.pfizerrxpathways.com/)

---

### Section 7 — Paragraph (fallback): Pipeline Snapshot

> **No component table** — rendered as plain Markdown (unique infographic)

Pipeline Snapshot as of February 3, 2026

![pipeline animated GIF](https://cdn.pfizer.com/pfizercom/2021-12/Pfizer_Pipeline_0.gif?VersionId=gPcSojStonFYq4iiLslZC_JSqiGXJJVd)

| Phase | Link |
|-------|------|
| Phase 1 | [View](/science/drug-product-pipeline?developement_phase=phase_1&area_of_focus=#pipeline-snapshot) |
| Phase 2 | [View](/science/drug-product-pipeline?developement_phase=phase_2&area_of_focus=#pipeline-snapshot) |
| Phase 3 | [View](/science/drug-product-pipeline?developement_phase=phase_3&area_of_focus=#pipeline-snapshot) |
| Registration | [View](/science/drug-product-pipeline?developement_phase=registration&area_of_focus=#pipeline-snapshot) |
| Total | [View](/science/drug-product-pipeline#pipeline-snapshot) |

[Explore the Product Pipeline](/science/drug-product-pipeline) · [Download Complete Pipeline PDF](https://cdn.pfizer.com/pfizercom/product-pipeline/Q4%202025%20Pipeline%20Update_vFinal3.pdf?VersionId=XSLcQ04JnYn3Py.PPsUP_5lAboV.fDPh)

---

### Section 8 — Corporate Carousel (col-4) (show-nav) (box-shadow)

> **Areas of Focus** — H4: *Revolutionary medicines enable us to enrich and extend life for people living with all types of diseases.*

| **Corporate Carousel (col-4) (show-nav) (box-shadow)** | |
|---|---|
| **Slide 1 image:** ![Internal medicine](https://cdn.pfizer.com/pfizercom/2021-11/Image%20%284%29_0.jpg?VersionId=kz.cUtW3uavzkfhvFYgolr6841Um.kk_) | **Internal Medicine** *(H5)* — We're developing therapies to treat, slow, or prevent disease progression and improve the quality of life for patients with obesity, type 2 diabetes, and cardiovascular and kidney diseases. [View All Internal Medicine](/science/focus-areas/internal-medicine) |
| **Slide 2 image:** ![Inflammation and Immunology](https://cdn.pfizer.com/pfizercom/2021-11/Image%20%281%29.jpg?VersionId=oyqdVDVC9xo7K6FWLdBn.9WT8DfPG2sA) | **Inflammation & Immunology** *(H5)* — We look for treatments that provide more than just symptom relief, in order to address the root cause of chronic inflammatory diseases at a molecular level. [View All Inflammation & Immunology](/science/focus-areas/immunology-inflammation) |
| **Slide 3 image:** ![Vaccines](https://cdn.pfizer.com/pfizercom/2021-11/Image%20%282%29.jpg?VersionId=yA1vxK.DXxDfdLu..nXnahVkHhoB5lD2) | **Vaccines** *(H5)* — Vaccines are the single most important innovation in the science of health to significantly reduce the threat of diseases that were once widespread and oftentimes fatal. [View All Vaccines](/science/focus-areas/vaccines) |
| **Slide 4 image:** ![Oncology](https://cdn.pfizer.com/pfizercom/2021-12/Oncology_0.jpg?VersionId=bXPQpCsp0GJiP5EvgBQprP7PrFIU2uui) | **Oncology** *(H5)* — Cancer treatment needs to be transformed across the entire landscape to significantly improve the lives of cancer patients worldwide. [View All Oncology](/science/focus-areas/oncology) |

---

### Section 9 — Paragraph (fallback): About

> **No component table** — rendered as plain Markdown

**About** *(H2 eyebrow)*

**Starting with Charles Pfizer inventing an almond-flavored antiparasite medicine in 1849, our people have always been innovators and trailblazers, committed to finding the next cure.** *(H4)*

[Learn More About Us](/about)

---

### Section 10 — Corporate Feature (image-right) (light)

| **Corporate Feature (image-right) (light)** | |
|---|---|
| **image** | ![Accord for healthier world globe](https://cdn.pfizer.com/pfizercom/2025-05/accord-healthier-worlds_0.png?VersionId=Z1aWfwSeWwUWyFRG6Gy7rnrslkl.Jql4) |
| **body** | **An Accord for a Healthier World** *(H4)* |
| | Where people live shouldn't impact the quality of their healthcare and income shouldn't determine health outcomes. |
| | [Learn More About The Accord](/accord) |

---

### Section 11 — Paragraph (fallback): Newsletter Signup

> **No component table** — rendered as plain Markdown (dark background section)

**Sign Up for communications from Pfizer** *(H3)*

Receive the latest news from Pfizer in our monthly The Breakthrough newsletter and email alerts on a variety of topics.

[Sign up now](/stories/subscription-center)

---

### Section 12 — Corporate Footer (copyright-long)

| **Corporate Footer (copyright-long)** | |
|---|---|
| **logo** | [![Pfizer logo](https://www.pfizer.com/profiles/pfecpfizercomus_profile/themes/pfecpfizercomus/public/assets/images/logo-blue.svg)](/) |
| **nav** (col 1) | - [Investors](http://investors.pfizer.com) |
| | - [Media](/newsroom) |
| | - [Careers](/about/careers) |
| | - [Partners](/about/partners) |
| **nav** (col 2) | - [PfizerForAll](https://www.pfizerforall.com/) |
| | - [Healthcare Professionals](https://www.pfizerpro.com) |
| | - [Grant Seekers](/about/health-policies/grants) |
| | - [Business to Business](/about/partners/B2B-and-suppliers) |
| **nav** (col 3) | - [Privacy Statement](/privacy) |
| | - [Accessibility Statement](/accessibility) |
| | - [Terms of Use](/terms) |
| | - [Contact Us](/contact) |
| **copyright** | © 2026 Pfizer Inc. All rights reserved. This information—including product information—is intended only for residents of the United States. The products discussed herein may have different labeling in different countries. |
| **socials** | - [Twitter](https://twitter.com/Pfizer) |
| | - [Facebook](https://www.facebook.com/Pfizer) |
| | - [LinkedIn](https://www.linkedin.com/company/pfizer) |
| | - [Instagram](https://www.instagram.com/pfizerinc/) |
| | - [YouTube](https://www.youtube.com/Pfizer) |
