"use client";

import React from 'react'
import Image from "next/image";
import { motion } from "framer-motion";
import Link from 'next/link';
import { useSectionInView } from "@/lib/hooks";
import { useActiveSectionContext } from "@/context/active-section-context";
import ArrowRightsvg from "@@/public/right-arrow-svgrepo-com.svg"
import Downloadsvg from "@@/public/download-minimalistic-svgrepo-com.svg"
import Linkedinsvg from "@@/public/linkedin-svgrepo-com.svg"
import Githubsvg from "@@/public/github-142-svgrepo-com.svg"
import { RoughNotation, RoughNotationGroup } from "react-rough-notation";

export default function Intro() {
    const { ref } = useSectionInView("Home", 0.5);
    const { setActiveSection, setTimeOfLastClick } = useActiveSectionContext();

    return (
        <section
            ref={ref}
            id="home"
            className="mb-28 max-w-[50rem] text-center sm:mb-0 scroll-mt-[100rem]">
            <div className="flex items-center justify-center">
                <div className="relative">
                    <div
                    >
                        <Link 
                        href = "http://localhost:3000/"
                        >
                            <Image
                                src="https://media.licdn.com/dms/image/D5635AQEDYSKWVvXfvQ/profile-framedphoto-shrink_200_200/0/1710145372090?e=1716120000&v=beta&t=wHPFplrrnO1zrH78K6aquB4DFfA5uBWep73JYZwVDsM"
                                alt="Dheeraj portrait"
                                width="192"
                                height="192"
                                quality="95"
                                priority={true}
                                className="h-24 w-24 rounded-full object-cover border-[0.1rem] border-white shadow-xl"
                            />
                        </Link>

                    </div>

                    <motion.span
                        className="absolute bottom-0 right-0 text-4xl"
                        initial={{ opacity: 0, scale: 0 }}
                        animate={{ opacity: 1, scale: 1 }}
                        transition={{
                            type: "spring",
                            stiffness: 125,
                            delay: 0.1,
                            duration: 0,
                        }}
                    >
                        👋
                    </motion.span>
                </div>
            </div>

            <h1
                className="mb-10 mt-4 px-4 text-2xl font-medium !leading-[1.5] sm:text-4xl"
            >
                <span className="font-bold">Hello, I'm Dheeraj.Yss.</span> I'm a{" "}
                <span className="font-bold">
                    <RoughNotation type="underline" show={true}>
                        Data Analyst
                    </RoughNotation>
                </span> with{" "}
                <span className="font-bold">7 months</span> of experience. I enjoy
                visuaizing <span className="italic">data &</span> writing <span className="italic">code</span>. My focus is{" "}
                <span className="">
                    <RoughNotation type="underline" show={true}>
                        T-SQL"
                    </RoughNotation>
                    Power BI, Python, React (Next.js)
                </span>.
            </h1>
            <div
                className="flex flex-col sm:flex-row items-center justify-center gap-8 px-0 text-lg font-medium"
            >
                <Link
                    href="#contact"
                    className="group flex items-center gap-2 outline-none"
                    onClick={() => {
                        setActiveSection("Contact");
                        setTimeOfLastClick(Date.now());
                    }}
                >
                    Contact me here{" "}
                    <Image src={ArrowRightsvg} alt='ArrowRightsvg' className="opacity-70 w-6 h-8 group-hover:translate-x-1 transition" />

                </Link>

                <a
                    className="group flex items-center gap-2 rounded-full outline-none transition cursor-pointer"
                    href="https://drive.google.com/file/d/1qHQDKmSaBU-1YMYfJfpBt6_HVbU9W5tE/view"
                    target="_blank"
                    download
                >
                    View CV{" "}
                    <Image src={Downloadsvg} alt='Downloadsvg' className="opacity-60 w-8 h-8 group-hover:translate-y-1 transition" />
                </a>

                <a
                    className="flex items-center gap-2 cursor-pointer"
                    href="https://www.linkedin.com/in/dheerajy1/"
                    target="_blank"
                >
                    <Image src={Linkedinsvg} alt='Linkedinsvg' className="w-10 h-10 object-cover" />
                </a>

                <a
                    className="flex items-center gap-2 cursor-pointer"
                    href="https://github.com/dheerajy1"
                    target="_blank"
                >
                    <Image src={Githubsvg} alt='Githubsvg' className="w-9 h-9 object-cover" />
                </a>
            </div>

        </section>
    )
}
