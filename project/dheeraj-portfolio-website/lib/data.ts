import React from "react";
import GraduateCap from "@@/public/graduate-cap-svgrepo-com.svg";
import Worksvg from "@@/public/work-suitcase-svgrepo-com.svg";
import Dataanalystsvg from "@@/public/data-line-svgrepo-com.svg";
import AwdashboardImg from "@@/public/Ingest data into SQL & Build AdventureWorks analytics dashboard.avif";
import IbcluscolcharpbiImg from "@@/public/Clustered Column chart in Power BI IBCS.avif";
import BackupcalImg from "@@/public/Backup strategy calculator.jpeg";
import Image from "next/image";

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
    title: "B.tech",
    location: "Hyderabad, India",
    description: "I graduated in Automobile engineering",
    icon: React.createElement(Image, {
      src: GraduateCap,
      alt: "Icon",
      width: 30,
      height: 30,
      style: { margin: 15 },
    }),
    date: "August, 2015 - June, 2019",
  },
  {
    title: "Technical Analyst",
    location: "Hyderabad, India",
    description:
      "I worked as an analyst for 7 months at RadarRadar Netherlands. I also handled ETL related issues",
    icon: React.createElement(Image, {
      src: Worksvg,
      alt: "Icon",
      width: 30,
      height: 30,
      style: { margin: 15 },
    }),
    date: "Sep, 2023 - March, 2024",
  },
  {
    title: "Data Analyst",
    location: "Hyderabad, India",
    description:
      "I'm now a Data analyst. My stack includes T-SQL, Power BI, Python, JavaScript. I'm open to full-time opportunities in  Data analytics position.",
    icon: React.createElement(Image, {
      src: Dataanalystsvg,
      alt: "Icon",
      width: 30,
      height: 30,
      style: { margin: 15 },
    }),
    date: "March, 2024 - present",
  },
] as const;

export const projectsData = [
  {
    title: "AWdashboard",
    description:
      "This project includes building a dashboard by ingesting data into SQL server and Power BI",
    tags: [
      "T-SQL",
      "Power BI",
      "SQL Server",
      "Data analytics",
      "Data engineering",
    ],
    imageUrl: AwdashboardImg,
  },
  {
    title: "IBCS chart in Power BI",
    description:
      "This project demonstrates the building of IBCS chart in Power BI",
    tags: ["Power BI", "SQL Server", "Data analytics", "Data engineering"],
    imageUrl: IbcluscolcharpbiImg,
  },
  {
    title: "Back up calculator",
    description:
      "A public web app for quick analytics on text. It shows backup count like Full bak count and T-logs count.",
    tags: ["JavaScript", "CSS", "HTML", "Web Application"],
    imageUrl: BackupcalImg,
  },
] as const;

export const skillsData = [
  "Data Engineering",
  "Data Analytics",
  "Power BI",
  "Microsoft Fabric",
  "SQL Server",
  "T-SQL",
  "Python",
  "JavaScript",
  "TypeScript",
  "React",
  "Next.js",
  "Node.js",
  "Git",
  "Tailwind",
  "Express.js",
  "Framer Motion",
  "HTML",
  "CSS",
] as const;

function generateRandomString(length: number): string {
  const characters =
    "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789%_";
  let result = "";
  for (let i = 0; i < length; i++) {
    const randomIndex = Math.floor(Math.random() * characters.length);
    result += characters.charAt(randomIndex);
  }
  return result;
}
