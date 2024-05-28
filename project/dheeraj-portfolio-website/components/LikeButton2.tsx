"use client";

import sendLikeCount from "@/actions/sendLikeCount";
import cookielikeCountChecks from "@/lib/cookielikeCountChecks";
import clsx from "clsx"
import React, { useState } from "react"
import toast from "react-hot-toast";

export const LikeButton2 = () => {
    const isLoading = true

    const [currentUserLikes, setincrementcurrentUserLikescount] = useState(1)

    return (
        <div className="relative flex flex-col items-center mb-2">
            {/* Thank you emojis */}

            <button
                className={clsx(
                    "shadow-lgx group relative block transform overflow-hidden rounded-lg bg-gradient-to-tl from-[#8ee4cc] to-[#ea92e8] p-1 transition-all duration-100 ease-out hover:scale-[1.2] active:scale-100 active:rounded-lg",
                    {
                        "animate-pulse": isLoading,
                        "hover:shadow-[#000000]": currentUserLikes === 0,
                        "hover:shadow-[#dd5f5f]": currentUserLikes !== 0,
                    },
                )}
                onClick={
                    async () => {

                        setincrementcurrentUserLikescount(currentUserLikes + 1);

                        if (!navigator.cookieEnabled) {
                            toast.error("Cookies are blocked or something went wrong!", {
                                duration: 4000,
                            });
                            return;
                        }

                        const { ip, error: cookielikeCountChecksError } = await cookielikeCountChecks(currentUserLikes)
                        if (cookielikeCountChecksError) {
                            toast.error(cookielikeCountChecksError);
                            return;
                        }

                        const { response, error: sendLikeCountError } = await sendLikeCount(ip, currentUserLikes);

                        if (sendLikeCountError) {
                            toast.error(sendLikeCountError);
                            return;
                        }
                        toast.success("Thank you for the Like!");

                    }}
            >


                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" strokeWidth={1.5} stroke="currentColor" className="relative w-5 transform text-[#000000] transition delay-100 duration-100 ease-out group-hover:scale-110"
                >
                    <path strokeLinecap="round" strokeLinejoin="round" d="M21 8.25c0-2.485-2.099-4.5-4.688-4.5-1.935 0-3.597 1.126-4.312 2.733-.715-1.607-2.377-2.733-4.313-2.733C5.1 3.75 3 5.765 3 8.25c0 7.22 9 12 9 12s9-4.78 9-12Z" />
                </svg>
            </button>
        </div>

    )
}