import React, { useEffect, useState } from "react";
import { RoughNotation } from "react-rough-notation";

interface RoughnotationProps {
    text: string;
}

const RoughNotationComponent: React.FC<RoughnotationProps> = ({ text }) => {
    const [showAnimation, setShowAnimation] = useState(false);

    useEffect(() => {
        setShowAnimation(true);
    }, [text]);

    return (
        <RoughNotation type="underline" show={showAnimation}>
            {text}
        </RoughNotation>
    );
};

export default RoughNotationComponent;
