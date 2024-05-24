"use client";

import React from "react";
import SectionHeading from "./section-heading";
import { useSectionInView } from "@/lib/hooks";
import { RoughNotation, RoughNotationGroup } from "react-rough-notation";

export default function About() {
    const { ref } = useSectionInView("About");

    return (
        <section
            ref={ref}
            className="mb-28 max-w-[45rem] text-center leading-8 sm:mb-40 scroll-mt-28"
            id="about"
        >
            <SectionHeading>About me</SectionHeading>
            <p className="mb-3">
                After graduating with a degree in{" "}
                <span className="font-medium">
                    Automobile engineering
                </span>,
                I decided to pursue my passion for programming. I enrolled in a SQL Server bootcamp and learned{" "}
                <span className="font-medium">
                    Database administration & parallely self taught full-stack web development during my 100 days of code
                </span>.{" "}
                <span className="italic">
                    My favorite part of programming
                </span>
                is the problem-solving aspect. I{" "}
                <span className="underline">
                    love
                </span> the
                feeling of finally figuring out a solution to a problem and building visualization. My core stack
                is{" "}
                <span className="font-medium">
                    SQL Server, Power BI, React, Next.js, Node.js, D3.js
                </span>
                . I am also familiar with TypeScript and Prisma. I am always looking to
                learn new technologies.
                I am currently looking for a{" "}
                <RoughNotation type="circle" color="#FFDB5C" show={true}>
                    <span className="font-medium">
                        full-time position
                    </span>
                    {" "}as a Data Analyst.
                </RoughNotation>

            </p>
            <p>
                <span className="italic">When I'm not coding
                </span>
                , I enjoy playing badminton games, watching travelling content, and playing virtual piano. I also enjoy{" "}
                <span className="font-medium">
                    learning new things
                </span>
                . I am currently learning {" "}
                <span className="font-medium">
                    cooking and philosophy
                </span>
                . I'm also learning how to play the guitar.
            </p>
        </section>
    );
}