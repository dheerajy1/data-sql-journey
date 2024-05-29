This article is about the code used to build my portfolio project.

# 1\. Setup

```powershell
npx create-next-app@latest
```

`npx create-next-app@latest .` to install in the current directory.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1715420526506/68fed28f-0a48-4a78-9adc-6f2df6ec3cc8.png)

to run server

```markdown
npm run dev
```

To remove the favicon.ico:

- stop the server using ctrl + c and type 'y' in the vscode terminal.
- delete the .next folder
- now start the server using the cmd `npm run dev`, the .next folder will be created automatically.

to check whether you have tailwind css installed or not: `npm view tailwindcss version`

absolute will take the div out of its flow.

CSS code for the bg blur:

```powershell
<div className="bg-[#fbe2e3] absolute top-[-6rem] -z-10 right-[11rem] h-[31.25rem] w-[31.25rem] rounded-full blur-[10rem] sm:w-[68.75rem] dark:bg-[#946263]"></div>
<div className="bg-[#dbd7fb] absolute top-[-1rem] -z-10 left-[-35rem] h-[31.25rem] w-[50rem] rounded-full blur-[10rem] sm:w-[68.75rem] md:left-[-33rem] lg:left-[-28rem] xl:left-[-15rem] 2xl:left-[-5rem] dark:bg-[#676394]"></div>
```

create a lib folder 📂.

create a data.ts file in the lib folder 📂.

paste the entire code in the data.ts file:

```javascript
import React from "react";
import { CgWorkAlt } from "react-icons/cg";
import { FaReact } from "react-icons/fa";
import { LuGraduationCap } from "react-icons/lu";
import corpcommentImg from "@/public/corpcomment.png";
import rmtdevImg from "@/public/rmtdev.png";
import wordanalyticsImg from "@/public/wordanalytics.png";

export const links = [
  {
    name: "Home",
    hash: "#home",
  },
  {
    name: "About",
    hash: "#about",
  },
  {
    name: "Projects",
    hash: "#projects",
  },
  {
    name: "Skills",
    hash: "#skills",
  },
  {
    name: "Experience",
    hash: "#experience",
  },
  {
    name: "Contact",
    hash: "#contact",
  },
] as const;

export const experiencesData = [
  {
    title: "Graduated bootcamp",
    location: "Miami, FL",
    description:
      "I graduated after 6 months of studying. I immediately found a job as a front-end developer.",
    icon: React.createElement(LuGraduationCap),
    date: "2019",
  },
  {
    title: "Front-End Developer",
    location: "Orlando, FL",
    description:
      "I worked as a front-end developer for 2 years in 1 job and 1 year in another job. I also upskilled to the full stack.",
    icon: React.createElement(CgWorkAlt),
    date: "2019 - 2021",
  },
  {
    title: "Full-Stack Developer",
    location: "Houston, TX",
    description:
      "I'm now a full-stack developer working as a freelancer. My stack includes React, Next.js, TypeScript, Tailwind, Prisma and MongoDB. I'm open to full-time opportunities.",
    icon: React.createElement(FaReact),
    date: "2021 - present",
  },
] as const;

export const projectsData = [
  {
    title: "CorpComment",
    description:
      "I worked as a full-stack developer on this startup project for 2 years. Users can give public feedback to companies.",
    tags: ["React", "Next.js", "MongoDB", "Tailwind", "Prisma"],
    imageUrl: corpcommentImg,
  },
  {
    title: "rmtDev",
    description:
      "Job board for remote developer jobs. I was the front-end developer. It has features like filtering, sorting and pagination.",
    tags: ["React", "TypeScript", "Next.js", "Tailwind", "Redux"],
    imageUrl: rmtdevImg,
  },
  {
    title: "Word Analytics",
    description:
      "A public web app for quick analytics on text. It shows word count, character count and social media post limits.",
    tags: ["React", "Next.js", "SQL", "Tailwind", "Framer"],
    imageUrl: wordanalyticsImg,
  },
] as const;

export const skillsData = [
  "HTML",
  "CSS",
  "JavaScript",
  "TypeScript",
  "React",
  "Next.js",
  "Node.js",
  "Git",
  "Tailwind",
  "Prisma",
  "MongoDB",
  "Redux",
  "GraphQL",
  "Apollo",
  "Express",
  "PostgreSQL",
  "Python",
  "Django",
  "Framer Motion",
] as const;
```

To use an SVG file in your React project, you can import it and then use it as a component. Here's how you can do it:

import using `@@` ,

```javascript
 "paths": {
      "@/*": ["./src/*"],
      "@@/*": ["./*"]
    }
```

then use the varibale.

```javascript
icon: GraduateCap,
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1715438999735/31187988-b0cf-473c-8fa0-a7a65ecec62e.png)

# 2\. Header

create components folder 📂

create header.tsx file.

install es7 + extension for boilerplates.

use rfc

install framer motion:

```javascript
npm install framer-motion
```

"use client"; to tell header.tsx file is a client component.

```javascript
<header className="z-[999] relative">
  <motion.div
    className="fixed top-0 left-1/2 h-[4.5rem] w-full rounded-none border border-white border-opacity-40 bg-white bg-opacity-80 shadow-lg shadow-black/[0.03] backdrop-blur-[0.5rem] sm:top-6 sm:h-[3.25rem] sm:w-[36rem] sm:rounded-full dark:bg-gray-950 dark:border-black/40 dark:bg-opacity-75"
    initial={{ y: -100, x: "-50%", opacity: 0 }}
    animate={{ y: 0, x: "-50%", opacity: 1 }}
  ></motion.div>

  <nav className="flex fixed top-[0.15rem] left-1/2 h-12 -translate-x-1/2 py-2 sm:top-[1.7rem] sm:h-[initial] sm:py-0">
    <ul className="flex w-[22rem] flex-wrap items-center justify-center gap-y-1 text-[0.9rem] font-medium text-gray-500 sm:w-[initial] sm:flex-nowrap sm:gap-5">
      {links.map((link) => (
        <motion.li
          className="h-3/4 flex items-center justify-center relative"
          key={link.hash}
          initial={{ y: -100, opacity: 0 }}
          animate={{ y: 0, opacity: 1 }}
        >
          <Link
            className={
              "flex w-full items-center justify-center px-3 py-3 hover:text-gray-950 transition dark:text-gray-500 dark:hover:text-gray-300"
            }
            href={link.hash}
          >
            {link.name}
          </Link>
        </motion.li>
      ))}
    </ul>
  </nav>
</header>
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1715439037756/41025b1d-ed5c-44b5-b59d-07896307cdc4.png)

# <mark>21st May</mark>

# 3\. Intro section

create intro.tsx file in components folder 📂

Everything belongs to same semantic meaning than using section.

In the page.tsx:

add the intro and place the cursor and hit: ctrl + spacebar and select the intro.tsx file to import into page.tsx.

modify next config mjs file to include the external image.

Extend eslintrc json to remove the apos syntax errors rules

```javascript
{
  "extends": "next/core-web-vitals",
  "rules": {
    "react/no-unescaped-entities": 0
  }
}
```

to use svg files

i have used image tag.

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1715527332116/efbe1506-fabf-4dde-923e-67b0ab5bd084.png)

install

```powershell
npm install @react-spring/web
```

# 4\. Section divider

create section-divider file.

```javascript
"use client";

import React from "react";

export default function SectionDivider() {
  return (
    <div
      className="bg-gray-200 my-24 h-16 w-1 rounded-full hidden sm:block dark:bg-opacity-20"
    ></div>
  );
}
```

add to page.tsx

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1715527565980/dc6cd813-0aa9-43db-9771-cd7eaaa453e6.png)

Using rough notation library

```javascript
npm install --save react-rough-notation
```

# 5\. About section

create about.tsx file

use rfc

create a file section-heading.tsx

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1715687397565/1439aa7b-0d74-40b7-88a3-60ca9bfef346.png)

# 6\. Projects section

create projects.tsx file

create project.tsx file

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1715687417449/80c5f076-585b-455b-a4fd-fe38ac1adc7f.png)


# 7\. Finish header

using scroll property to scroll to the sections.

adding smooth scroll for all the layout.

keeping track of active section using state.

install clsx framework to apply classes conditionally

```powershell
npm install --save clsx
```

conditionally applying background color

```javascript
{
    link.name === activeSection && (
        <motion.span
            className="bg-gray-100 rounded-full absolute inset-0 -z-10 dark:bg-gray-800"
            layoutId="activeSection"
            transition={{
                type: "spring",
                stiffness: 380,
                damping: 30,
            }}
        ></motion.span>
    )
}
```

using onclick:

```javascript
 onClick={() => {
                  setActiveSection(link.name);
                  setTimeOfLastClick(Date.now());
                }}
```

as you scroll the active session should change the background not only when you click:

intersection observer API in react intersection observer

```powershell
npm install react-intersection-observer --save
```

create context folder and create active-section-context.tsx file

create hook.ts file in lib folder 📂

create types.ts file in lib folder 📂

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1715698694371/1e5079e3-ca14-4e61-b904-dac492b97dae.png)

# 8\. Skills section

create a skills.tsx file

# 9\. Experience section

create experience.tsx file

```powershell
npm i react-vertical-timeline-component
```

types declaration package

```powershell
npm i --save-dev @types/react-vertical-timeline-component
```

create theme-context.tsx file

Error:

* Server Error Error: Cannot read properties of undefined (reading 'prototype')
    
    * `"use client";`
        

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1715836879599/ed7cb783-dd30-4bb0-b341-48f1b84d8e90.png)


# 10\. Contact section

create contact.tsx file

toast

```powershell
npm install react-hot-toast
```

create email folder and contact-form-email.tsx file

```powershell
npm i @react-email/components
```

create actions folder 📂 and sendEmail.ts file:

create utils.ts file in lib folder

create submit-btn.tsx file in component folder

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1715892561275/8a798ffe-eb67-4814-a446-34b8d48d8a05.png)

improved:

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1715964909012/dc2199ad-a920-4e08-b758-e09388f85f0f.png)

# 11\. Footer

create footer.tsx file

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1716029220538/5b5c2f9b-c0da-4f57-a57b-d30556f45ea1.png)


added functionality to let user like

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1716908745293/b7e2b365-e3b1-482e-a099-f9502fe60f72.png)

adding error checks

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1716996708414/55b5703e-c005-4e56-aae8-cc7897530178.png)


Final:

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1716996927818/bf9d47a6-ee1b-4e10-a3b1-630a184ab646.png)


# Conclusion

Learning Objectives,

1. Setup using next js

2. Project setup,

3. Installing dependencies,

4. using scroll property to scroll to the sections.

5. implemented toast lib

6. Implemented predefined text messages.

7. Added functionality to like

8. Added error checks


# Source: ByteGrad YT \[[Link](https://www.youtube.com/watch?v=sUKptmUVIBM)\], \[[Link](https://github.com/ByteGrad/portfolio-website.git)\]

# Author: Dheeraj. Yss

# Connect with me:

- [My Twitter](https://twitter.com/yssdheeraj)
- [My LinkedIn](https://www.linkedin.com/in/dheerajy1/)
- [My GitHub](https://github.com/dheerajy1)
- [My Hashnode](https://dheerajy1.hashnode.dev/)
