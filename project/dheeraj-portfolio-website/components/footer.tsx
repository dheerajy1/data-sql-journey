import React from "react";
import { LikeButton2 } from "./LikeButton2";

export default function Footer() {

  return (

    <footer className="mb-2 px-4 text-center text-gray-500">

      <LikeButton2 />

      <small className="mb-2 block text-xs">
        &copy; 2024 Dheeraj.Yss All rights reserved.
      </small>
      <p className="text-xs">
        <span className="font-semibold">About this website:</span> built with
        React & Next.js (App Router & Server Actions), TypeScript, Tailwind CSS,
        Framer Motion, Github hosting.
      </p>
    </footer>
  );
}