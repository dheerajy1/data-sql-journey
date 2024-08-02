This article talks about the performing data analysis and building data visualizations for Air pollutants data from Our World in Data.

# 1\. Data Source

Data for

1. Air pollutants \[[**Link**\]](https://ourworldindata.org/explorers/air-pollution?time=1750..latest&uniformYAxis=0&Pollutant=All+pollutants&Sector=From+all+sectors+%28Total%29&Per+capita=false&country=USA~CHN~IND~GBR~OWID_WRL)

# **2\. Ingest Data**

File attachement.

# 3\. Explore Data

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1721844703820/9dad49b9-628f-4548-94ad-7d668f9f66c2.png)

# 4\. Data transformations

```sql
SELECT COUNT(*) AS "Total_Rows"
FROM airPollution
```

# 5\. Visualize data

## 5.1 Card

```xml
<div class="main-container" style="">
  <div class="container">
    <svg class="color1" viewBox="0 0 465 408" fill="none" xmlns="http://www.w3.org/2000/svg">
      <g filter="url(#filter0_f_1_11)">
        <path d="M131.708 242.056C147.41 133.679 218.698 131.25 252.379 143.583C257.225 132.578 277.604 117.172 320.348 143.583C341.429 160.09 350.806 159.976 351.969 225.549C353.132 291.122 320.953 311.69 304.718 313.777H202.584C172.416 335.027 116.006 350.434 131.708 242.056Z" />
      </g>
      <defs>
        <filter id="filter0_f_1_11" x="0" y="0" width="481" height="458" filterUnits="userSpaceOnUse" color-interpolation-filters="sRGB">
          <feFlood flood-opacity="0" result="BackgroundImageFix" />
          <feBlend mode="normal" in="SourceGraphic" in2="BackgroundImageFix" result="shape" />
          <feGaussianBlur stdDeviation="64.5" result="effect1_foregroundBlur_1_11" />
        </filter>
      </defs>
    </svg>

    <svg class="color2" viewBox="0 0 378 405" fill="none" xmlns="http://www.w3.org/2000/svg">
      <g filter="url(#filter0_f_1_5)">
        <path d="M215.096 264.863C231.993 207.121 162.183 120.603 220.473 144.628C278.763 168.652 325.84 241.568 308.943 299.309C292.045 357.051 217.573 377.753 159.283 353.729C100.993 329.704 198.198 322.604 215.096 264.863Z" fill="url(#paint0_linear_1_5)" />
      </g>
      <defs>
        <filter id="filter0_f_1_5" x="0.866425" y="0.511726" width="451.556" height="503.05" filterUnits="userSpaceOnUse" color-interpolation-filters="sRGB">
          <feFlood flood-opacity="0" result="BackgroundImageFix" />
          <feBlend mode="normal" in="SourceGraphic" in2="BackgroundImageFix" result="shape" />
          <feGaussianBlur stdDeviation="70" result="effect1_foregroundBlur_1_5" />
        </filter>
        <linearGradient id="paint0_linear_1_5" x1="208.732" y1="374.109" x2="291.285" y2="173.813" gradientUnits="userSpaceOnUse">
          <stop stop-color="" />
          <stop offset="1" stop-color="" stop-opacity="" />
        </linearGradient>
      </defs>
    </svg>

    <svg class="color3" viewBox="0 0 423 518" fill="none" xmlns="http://www.w3.org/2000/svg">
      <g filter="url(#filter0_f_1_4)">
      <path d="M326.284 357.156C301.741 343.549 238.633 204.487 252.688 168.783C266.743 133.079 298.094 159.882 362.008 211.727C386.551 225.334 410.226 281.442 396.172 317.146C382.117 352.85 350.827 370.763 326.284 357.156Z" fill="url(#paint0_linear_1_4)"/>
      </g>
      <defs>
        <filter id="filter0_f_1_4" x="0.670303" y="-97.5213" width="649.706" height="709.232" filterUnits="userSpaceOnUse" color-interpolation-filters="sRGB">
          <feFlood flood-opacity="0" result="BackgroundImageFix"/>
          <feBlend mode="normal" in="SourceGraphic" in2="BackgroundImageFix" result="shape"/>
          <feGaussianBlur stdDeviation="125" result="effect1_foregroundBlur_1_4"/>
        </filter>
        <linearGradient id="paint0_linear_1_4" x1="297.488" y1="320.285" x2="409.279" y2="303.653" gradientUnits="userSpaceOnUse">
          <stop stop-color=""/>
          <stop offset="1" stop-color="" stop-opacity=""/>
        </linearGradient>
      </defs>
    </svg>

    <div class="card" style="padding: 0rem 3rem 0rem 3rem; ">
      <p style="font-size:1rem; opacity: 1;">
        TotalRows
      </p>
      <p style="opacity: 1;">
        ${TotalRows[0].Total_Rows}
      </p>
    </div>
  </div>
</div>
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1722183154154/6dc5db8b-8ef4-4f17-aa67-62d31f054c1a.png)

## 5.2 Nitrogen oxide (NOx) trend

```javascript
Plot.plot({
  marks: [
    Plot.ruleY([0]),
    Plot.ruleX(airPollution, {
      x: "Year",
      y: "Nitrogen oxide (NOx)",
      tip: true,
    }),
  ],
  width,
  marginBottom: 60,
  marginLeft: 60,
});
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1722183351153/8eb22e35-0d2d-4b0b-81a6-9e09e77545a3.png)

## 5.3 Nitrogen oxide (NOx) trend for selective countries

```javascript
<div class="main-container" style="">
  <div class="container">
    <svg
      class="color1"
      viewBox="0 0 465 408"
      fill="none"
      xmlns="http://www.w3.org/2000/svg"
    >
      <g filter="url(#filter0_f_1_11)">
        <path d="M131.708 242.056C147.41 133.679 218.698 131.25 252.379 143.583C257.225 132.578 277.604 117.172 320.348 143.583C341.429 160.09 350.806 159.976 351.969 225.549C353.132 291.122 320.953 311.69 304.718 313.777H202.584C172.416 335.027 116.006 350.434 131.708 242.056Z" />
      </g>
      <defs>
        <filter
          id="filter0_f_1_11"
          x="0"
          y="0"
          width="481"
          height="458"
          filterUnits="userSpaceOnUse"
          color-interpolation-filters="sRGB"
        >
          <feFlood flood-opacity="0" result="BackgroundImageFix" />
          <feBlend
            mode="normal"
            in="SourceGraphic"
            in2="BackgroundImageFix"
            result="shape"
          />
          <feGaussianBlur
            stdDeviation="64.5"
            result="effect1_foregroundBlur_1_11"
          />
        </filter>
      </defs>
    </svg>

    <svg
      class="color2"
      viewBox="0 0 378 405"
      fill="none"
      xmlns="http://www.w3.org/2000/svg"
    >
      <g filter="url(#filter0_f_1_5)">
        <path
          d="M215.096 264.863C231.993 207.121 162.183 120.603 220.473 144.628C278.763 168.652 325.84 241.568 308.943 299.309C292.045 357.051 217.573 377.753 159.283 353.729C100.993 329.704 198.198 322.604 215.096 264.863Z"
          fill="url(#paint0_linear_1_5)"
        />
      </g>
      <defs>
        <filter
          id="filter0_f_1_5"
          x="0.866425"
          y="0.511726"
          width="451.556"
          height="503.05"
          filterUnits="userSpaceOnUse"
          color-interpolation-filters="sRGB"
        >
          <feFlood flood-opacity="0" result="BackgroundImageFix" />
          <feBlend
            mode="normal"
            in="SourceGraphic"
            in2="BackgroundImageFix"
            result="shape"
          />
          <feGaussianBlur
            stdDeviation="70"
            result="effect1_foregroundBlur_1_5"
          />
        </filter>
        <linearGradient
          id="paint0_linear_1_5"
          x1="208.732"
          y1="374.109"
          x2="291.285"
          y2="173.813"
          gradientUnits="userSpaceOnUse"
        >
          <stop stop-color="" />
          <stop offset="1" stop-color="" stop-opacity="" />
        </linearGradient>
      </defs>
    </svg>

    <svg
      class="color3"
      viewBox="0 0 423 518"
      fill="none"
      xmlns="http://www.w3.org/2000/svg"
    >
      <g filter="url(#filter0_f_1_4)">
        <path
          d="M326.284 357.156C301.741 343.549 238.633 204.487 252.688 168.783C266.743 133.079 298.094 159.882 362.008 211.727C386.551 225.334 410.226 281.442 396.172 317.146C382.117 352.85 350.827 370.763 326.284 357.156Z"
          fill="url(#paint0_linear_1_4)"
        />
      </g>
      <defs>
        <filter
          id="filter0_f_1_4"
          x="0.670303"
          y="-97.5213"
          width="649.706"
          height="709.232"
          filterUnits="userSpaceOnUse"
          color-interpolation-filters="sRGB"
        >
          <feFlood flood-opacity="0" result="BackgroundImageFix" />
          <feBlend
            mode="normal"
            in="SourceGraphic"
            in2="BackgroundImageFix"
            result="shape"
          />
          <feGaussianBlur
            stdDeviation="125"
            result="effect1_foregroundBlur_1_4"
          />
        </filter>
        <linearGradient
          id="paint0_linear_1_4"
          x1="297.488"
          y1="320.285"
          x2="409.279"
          y2="303.653"
          gradientUnits="userSpaceOnUse"
        >
          <stop stop-color="" />
          <stop offset="1" stop-color="" stop-opacity="" />
        </linearGradient>
      </defs>
    </svg>

    <div class="card" style="width:95%; height:100%; font-size:2rem;">
      $
      {(() => {
        const data = airPollution.filter((d) =>
          [
            "United Kingdom",
            "United States",
            "India",
            "China",
            "World",
          ].includes(d.Entity)
        );

        return Plot.plot({
          marks: [
            Plot.line(data, {
              x: "Year",
              y: "Nitrogen oxide (NOx)",
              z: "Entity",
              stroke: "Entity",
              tip: true,
            }),
            Plot.ruleX(
              data,
              Plot.pointerX({
                x: "Year",
                py: "Nitrogen oxide (NOx)",
                z: "Entity",
                stroke: "red",
              })
            ),
            Plot.dot(
              data,
              Plot.pointerX({
                x: "Year",
                y: "Nitrogen oxide (NOx)",
                z: "Entity",
                stroke: "red",
              })
            ),
            Plot.text(
              data,
              Plot.selectLast({
                x: "Year",
                y: "Nitrogen oxide (NOx)",
                z: "Entity",
                text: "Entity",
                textAnchor: "start",
                dx: -3,
                dy: 9,
              })
            ),
          ],
          y: {
            type: "linear",
            grid: true,
            nice: true,
            tickFormat: (d) => (d === 0 ? "0" : d / 1e6 + "M t"), // Format tick values in millions and append "t"
            domain: [0, 140000000], // Set the maximum value to 140M
            ticks: 8, // Set the number of ticks to 8, with a step of 20M
          },
          color: {
            scheme: "spectral",
            legend: true,
          },
          title: "Nitrogen oxide (NOx) trend",
          width,
          marginLeft: 70,
        });
      })()}
    </div>
  </div>
</div>
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1722183384754/cd7a329a-8387-4a8b-a295-4c90135b31b2.png)

## 5.4 Sulphur dioxide (SO₂) emissions trend for selective countries

```javascript
<div class="main-container" style="">
  <div class="container">
    <svg
      class="color1"
      viewBox="0 0 465 408"
      fill="none"
      xmlns="http://www.w3.org/2000/svg"
    >
      <g filter="url(#filter0_f_1_11)">
        <path d="M131.708 242.056C147.41 133.679 218.698 131.25 252.379 143.583C257.225 132.578 277.604 117.172 320.348 143.583C341.429 160.09 350.806 159.976 351.969 225.549C353.132 291.122 320.953 311.69 304.718 313.777H202.584C172.416 335.027 116.006 350.434 131.708 242.056Z" />
      </g>
      <defs>
        <filter
          id="filter0_f_1_11"
          x="0"
          y="0"
          width="481"
          height="458"
          filterUnits="userSpaceOnUse"
          color-interpolation-filters="sRGB"
        >
          <feFlood flood-opacity="0" result="BackgroundImageFix" />
          <feBlend
            mode="normal"
            in="SourceGraphic"
            in2="BackgroundImageFix"
            result="shape"
          />
          <feGaussianBlur
            stdDeviation="64.5"
            result="effect1_foregroundBlur_1_11"
          />
        </filter>
      </defs>
    </svg>

    <svg
      class="color2"
      viewBox="0 0 378 405"
      fill="none"
      xmlns="http://www.w3.org/2000/svg"
    >
      <g filter="url(#filter0_f_1_5)">
        <path
          d="M215.096 264.863C231.993 207.121 162.183 120.603 220.473 144.628C278.763 168.652 325.84 241.568 308.943 299.309C292.045 357.051 217.573 377.753 159.283 353.729C100.993 329.704 198.198 322.604 215.096 264.863Z"
          fill="url(#paint0_linear_1_5)"
        />
      </g>
      <defs>
        <filter
          id="filter0_f_1_5"
          x="0.866425"
          y="0.511726"
          width="451.556"
          height="503.05"
          filterUnits="userSpaceOnUse"
          color-interpolation-filters="sRGB"
        >
          <feFlood flood-opacity="0" result="BackgroundImageFix" />
          <feBlend
            mode="normal"
            in="SourceGraphic"
            in2="BackgroundImageFix"
            result="shape"
          />
          <feGaussianBlur
            stdDeviation="70"
            result="effect1_foregroundBlur_1_5"
          />
        </filter>
        <linearGradient
          id="paint0_linear_1_5"
          x1="208.732"
          y1="374.109"
          x2="291.285"
          y2="173.813"
          gradientUnits="userSpaceOnUse"
        >
          <stop stop-color="" />
          <stop offset="1" stop-color="" stop-opacity="" />
        </linearGradient>
      </defs>
    </svg>

    <svg
      class="color3"
      viewBox="0 0 423 518"
      fill="none"
      xmlns="http://www.w3.org/2000/svg"
    >
      <g filter="url(#filter0_f_1_4)">
        <path
          d="M326.284 357.156C301.741 343.549 238.633 204.487 252.688 168.783C266.743 133.079 298.094 159.882 362.008 211.727C386.551 225.334 410.226 281.442 396.172 317.146C382.117 352.85 350.827 370.763 326.284 357.156Z"
          fill="url(#paint0_linear_1_4)"
        />
      </g>
      <defs>
        <filter
          id="filter0_f_1_4"
          x="0.670303"
          y="-97.5213"
          width="649.706"
          height="709.232"
          filterUnits="userSpaceOnUse"
          color-interpolation-filters="sRGB"
        >
          <feFlood flood-opacity="0" result="BackgroundImageFix" />
          <feBlend
            mode="normal"
            in="SourceGraphic"
            in2="BackgroundImageFix"
            result="shape"
          />
          <feGaussianBlur
            stdDeviation="125"
            result="effect1_foregroundBlur_1_4"
          />
        </filter>
        <linearGradient
          id="paint0_linear_1_4"
          x1="297.488"
          y1="320.285"
          x2="409.279"
          y2="303.653"
          gradientUnits="userSpaceOnUse"
        >
          <stop stop-color="" />
          <stop offset="1" stop-color="" stop-opacity="" />
        </linearGradient>
      </defs>
    </svg>

    <div class="card" style="width:95%; height:100%; font-size:2rem;">
      $
      {(() => {
        const data = airPollution.filter((d) =>
          [
            "United Kingdom",
            "United States",
            "India",
            "China",
            "World",
          ].includes(d.Entity)
        );

        return Plot.plot({
          marks: [
            Plot.line(data, {
              x: "Year",
              y: "Sulphur dioxide (SO₂) emissions",
              z: "Entity",
              stroke: "Entity",
              tip: true,
            }),
            Plot.ruleX(
              data,
              Plot.pointerX({
                x: "Year",
                py: "Sulphur dioxide (SO₂) emissions",
                z: "Entity",
                stroke: "red",
              })
            ),
            Plot.dot(
              data,
              Plot.pointerX({
                x: "Year",
                y: "Sulphur dioxide (SO₂) emissions",
                z: "Entity",
                stroke: "red",
              })
            ),
            Plot.text(
              data,
              Plot.selectLast({
                x: "Year",
                y: "Sulphur dioxide (SO₂) emissions",
                z: "Entity",
                text: "Entity",
                textAnchor: "start",
                dx: -3,
                dy: 9,
              })
            ),
          ],
          y: {
            type: "linear",
            grid: true,
            nice: true,
            tickFormat: (d) => (d === 0 ? "0" : d / 1e6 + "M t"), // Format tick values in millions and append "t"
            domain: [0, 140000000], // Set the maximum value to 140M
            ticks: 8, // Set the number of ticks to 8, with a step of 20M
          },
          color: {
            scheme: "spectral",
            legend: true,
          },
          title: "Sulphur dioxide (SO₂) emissions Trend",
          width,
          marginLeft: 70,
        });
      })()}
    </div>
  </div>
</div>
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1722183532695/e830afab-34ba-42ab-9959-a2a0af68f096.png)

styles

```css
<style>
 :root {
    --theme-foreground: #1b1e23;
  --theme-foreground-focus: #3b5fc0;
  --theme-background-a: #ffffff;
  --theme-background-b: color-mix(in srgb, var(--theme-foreground) 4%, var(--theme-background-a));
  --theme-background: var(--theme-background-a);
  --theme-background-alt: var(--theme-background-b);
  --theme-foreground-alt: color-mix(in srgb, var(--theme-foreground) 90%, var(--theme-background-a));
  --theme-foreground-muted: color-mix(in srgb, var(--theme-foreground) 60%, var(--theme-background-a));
  --theme-foreground-faint: color-mix(in srgb, var(--theme-foreground) 50%, var(--theme-background-a));
  --theme-foreground-fainter: color-mix(in srgb, var(--theme-foreground) 30%, var(--theme-background-a));
  --theme-foreground-faintest: color-mix(in srgb, var(--theme-foreground) 14%, var(--theme-background-a));
  color-scheme: light;
}
.main-container {
  position: relative;
  width: 100%;
  height: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
  /*   background: grey; */
  padding: 1rem 0 1rem 0;
/*   border: 0.1px solid black; */
}

.container {
  position: relative;
  width: fit-content;
  height: fit-content;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 0rem;
  border-radius: 0.75rem;
/*   overflow: hidden; */
/*   border: 0.1px solid black; */
}

.color1,
.color2,
.color3 {
  position: absolute;
  width: 100%;
  height: 100%;
/*   display: flex;
  align-items: center;
  justify-content: center; */
  border-radius: 0.75rem;
  z-index -55555;
}
.color1 {
  top: -25%;
  left: -30%;
}

.color1 path {
  fill: #DD8A8A;
  fill-opacity: 0.2;
}

.color2 {
  top: 0;
  right: 50%;
}

.color2 path {
  fill: ##ECFF79;
  fill-opacity: 0.3;
}

.color2 linearGradient stop:first-child {
  stop-color: #FFE924;
}

.color2 linearGradient stop:last-child {
  stop-color: #ECFF79;
  stop-opacity: 0.32;
}

.color3 {
  bottom: -20%;
/*   background: radial-gradient(circle at center, #bb9ab1); */
}

.color3 path {
  fill: ##ECFF79;
  fill-opacity: 0.3;
}

.color3 linearGradient stop:first-child {
  stop-color: #3EF3C8;
}

.color3 linearGradient stop:last-child {
  stop-color: #3EF3C8;
  stop-opacity: 0.5;
}

.card {
  display: flex;
  flex-direction: column;
  gap: 1px;
  align-items: center;
background: linear-gradient(to right, rgba(255, 255, 255, 0.1), rgba(230, 230, 230, 0.1), rgba(255, 255, 255, 0.1));
  border: solid 1px var(--theme-foreground-faintest);
  border-radius: 0.75rem;
  padding: 1.5rem 1.5rem 1.5rem 1.5rem;
  font: 1.5rem sans-serif;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.5); /* Added this line */
  opacity: 1;
  backdrop-filter: blur(1px);
  z-index: 9999;
/*   border: 0.1px solid black; */
}
  .card > p{
  width: 100%;
  height: 100%;
/*   padding: 0.5rem; */
/*   border: 0.1px solid black; */
  }
<style/>
```

5.5 Carbon monoxide (CO) emissions

```javascript
Plot.plot({
  marks: [
    Plot.line(data, {
      x: "Year",
      y: "Carbon monoxide (CO) emissions",
      z: "Entity",
      stroke: "Entity",
      tip: true,
    }),
    Plot.ruleX(
      data,
      Plot.pointerX({
        x: "Year",
        py: "Carbon monoxide (CO) emissions",
        z: "Entity",
        stroke: "red",
      })
    ),
    Plot.dot(
      data,
      Plot.pointerX({
        x: "Year",
        y: "Carbon monoxide (CO) emissions",
        z: "Entity",
        stroke: "red",
      })
    ),
    Plot.text(
      data,
      Plot.selectLast({
        x: "Year",
        y: "Carbon monoxide (CO) emissions",
        z: "Entity",
        text: "Entity",
        textAnchor: "start",
        dx: -3,
        dy: 9,
      })
    ),
  ],
  y: {
    type: "linear",
    grid: true,
    nice: true,
    tickFormat: (d) => (d === 0 ? "0" : d / 1e6 + "M t"), // Format tick values in millions and append "t"
    domain: [0, 140000000], // Set the maximum value to 140M
    ticks: 8, // Set the number of ticks to 8, with a step of 20M
  },
  color: {
    scheme: "spectral",
    legend: true,
  },
  title: "Carbon monoxide (CO) Trend",
  width,
});
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1722276801510/ecf137de-b51d-426f-a1e1-0f3dc30ef263.png)

Fixed the y axis range issue in Carbon monoxide (CO) emissions viz:

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1722446797396/4a85c348-9b90-4bcc-82e7-19171fbe0909.png)

# 5.6 Carbon monoxide (CO) emissions Data viz reactive to pointer

```javascript
viewof CO = Plot.plot({
  marks: [
    Plot.line(data, {
      x: "Year",
      y: "Carbon monoxide (CO) emissions",
      z: "Entity",
      stroke: "Entity",
      tip: true
    })
  ]
})
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1722364023051/ebad03e0-a1ab-426f-958f-7ea570526def.png)


## 5.7 Organic carbon (OC) emissions

```javascript
<div class="main-container" style=""> 
    <div class="svg-container">
    <svg class="svg1" viewBox="0 0 651 710" fill="none" xmlns="http://www.w3.org/2000/svg">
      <g filter="url(#filter0_f_11_2)">
        <path d="M326.28 455.153C301.737 441.546 238.629 302.484 252.684 266.78C266.739 231.076 298.09 257.878 362.004 309.723C386.547 323.33 410.222 379.439 396.167 415.143C382.113 450.847 350.823 468.76 326.28 455.153Z" fill="url(#paint0_linear_11_2)" />
      </g>
      <defs>
        <filter id="filter0_f_11_2" x="0.665921" y="0.475006" width="649.706" height="709.232" filterUnits="userSpaceOnUse" color-interpolation-filters="sRGB">
          <feFlood flood-opacity="0" result="BackgroundImageFix" />
          <feBlend mode="normal" in="SourceGraphic" in2="BackgroundImageFix" result="shape" />
          <feGaussianBlur stdDeviation="100" result="effect1_foregroundBlur_11_2" />
        </filter>
        <linearGradient id="paint0_linear_11_2" x1="297.484" y1="418.282" x2="409.275" y2="401.649" gradientUnits="userSpaceOnUse">
          <stop stop-color="#3EF3C8" />
          <stop offset="1" stop-color="#3EF3C8" stop-opacity="0.5" />
        </linearGradient>
      </defs>
    </svg>

    <svg class="svg2" viewBox="0 0 465 408" fill="none" xmlns="http://www.w3.org/2000/svg">
      <g filter="url(#filter0_f_1_11)">
        <path d="M131.708 242.056C147.41 133.679 218.698 131.25 252.379 143.583C257.225 132.578 277.604 117.172 320.348 143.583C341.429 160.09 350.806 159.976 351.969 225.549C353.132 291.122 320.953 311.69 304.718 313.777H202.584C172.416 335.027 116.006 350.434 131.708 242.056Z" fill="#DD8A8A" fill-opacity="0.79" />
      </g>
      <defs>
        <filter id="filter0_f_1_11" x="0" y="0" width="481" height="458" filterUnits="userSpaceOnUse" color-interpolation-filters="sRGB">
          <feFlood flood-opacity="0" result="BackgroundImageFix" />
          <feBlend mode="normal" in="SourceGraphic" in2="BackgroundImageFix" result="shape" />
          <feGaussianBlur stdDeviation="90" result="effect1_foregroundBlur_1_11" />
        </filter>
      </defs>
    </svg>

    <svg class="svg3" viewBox="0 0 428 459" fill="none" xmlns="http://www.w3.org/2000/svg">
      <g filter="url(#filter0_f_1_9)">
        <path d="M211.76 251.893C252.437 257.839 284.97 364.837 287.558 295.009C290.145 225.18 259.215 147.128 218.538 141.183C177.861 135.238 142.84 203.651 140.253 273.479C137.665 343.308 171.082 245.948 211.76 251.893Z" fill="url(#paint0_linear_1_9)" />
      </g>
      <defs>
        <filter id="filter0_f_1_9" x="0.111717" y="0.821381" width="427.597" height="457.756" filterUnits="userSpaceOnUse" color-interpolation-filters="sRGB">
          <feFlood flood-opacity="0" result="BackgroundImageFix" />
          <feBlend mode="normal" in="SourceGraphic" in2="BackgroundImageFix" result="shape" />
          <feGaussianBlur stdDeviation="70" result="effect1_foregroundBlur_1_9" />
        </filter>
        <linearGradient id="paint0_linear_1_9" x1="142.448" y1="214.242" x2="290.347" y2="219.723" gradientUnits="userSpaceOnUse">
          <stop stop-color="#FFE924" />
          <stop offset="1" stop-color="#ECFF79" stop-opacity="0.32" />
        </linearGradient>
      </defs>
    </svg>
  </div>
<div class="card" style="width:100%; height:100%; font-size:2rem;">
  ${(() => {
    const data = airPollution.filter((d) =>
      ["United Kingdom", "United States", "India", "China", "World"].includes(
        d.Entity
      )
    );

    return Plot.plot({
  marks: [
    Plot.line(data, {
      x: "Year",
      y: "Organic carbon (OC) emissions",
      z: "Entity",
      stroke: "Entity",
      tip: true
    }),
    Plot.ruleX(
      data,
      Plot.pointerX({
        x: "Year",
        py: "Organic carbon (OC) emissions",
        z: "Entity",
        stroke: "red"
      })
    ),
    Plot.dot(
      data,
      Plot.pointerX({
        x: "Year",
        y: "Organic carbon (OC) emissions",
        z: "Entity",
        stroke: "red"
      })
    ),
    Plot.text(
      data,
      Plot.selectLast({
        x: "Year",
        y: "Organic carbon (OC) emissions",
        z: "Entity",
        text: "Entity",
        textAnchor: "start",
        dx: -3,
        dy: 9
      })
    )
  ],
  y: {
    type: "linear",
    grid: true,
    nice: true,
    tickFormat: (d) => (d === 0 ? "0" : d / 1e6 + "M t"), // Format tick values in millions and append "t"
    domain: d3.extent(data, (d) => d["Organic carbon (OC) emissions"]), // Set the maximum value 
    ticks: 8 // Set the number of ticks to 8, with a step of 20M
  },
  color: {
    scheme: "spectral",
    legend: true
  },
  title: "Organic carbon (OC) emissions Trend",
  width
});
  })()}
  </div>
</div>
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1722531634420/2cea9d9f-b459-49ee-91fe-6ac8c448ec28.png)



## 5.7 Non-methane volatile organic compounds (NMVOCs) emissions

```javascript
<div class="main-container" style=""> 
  <div class="card-svg-container" style="font-size:2rem;">
    
    <div class="svg-container">

      <svg class="svg1" viewBox="0 0 651 710" fill="none" xmlns="http://www.w3.org/2000/svg">
        <g filter="url(#filter0_f_11_2)">
          <path d="M326.28 455.153C301.737 441.546 238.629 302.484 252.684 266.78C266.739 231.076 298.09 257.878 362.004 309.723C386.547 323.33 410.222 379.439 396.167 415.143C382.113 450.847 350.823 468.76 326.28 455.153Z" fill="url(#paint0_linear_11_2)" />
        </g>
        <defs>
          <filter id="filter0_f_11_2" x="0.665921" y="0.475006" width="649.706" height="709.232" filterUnits="userSpaceOnUse" color-interpolation-filters="sRGB">
            <feFlood flood-opacity="0" result="BackgroundImageFix" />
            <feBlend mode="normal" in="SourceGraphic" in2="BackgroundImageFix" result="shape" />
            <feGaussianBlur stdDeviation="100" result="effect1_foregroundBlur_11_2" />
          </filter>
          <linearGradient id="paint0_linear_11_2" x1="297.484" y1="418.282" x2="409.275" y2="401.649" gradientUnits="userSpaceOnUse">
            <stop stop-color="#3EF3C8" />
            <stop offset="1" stop-color="#3EF3C8" stop-opacity="0.5" />
          </linearGradient>
        </defs>
      </svg>
  
      <svg class="svg2" viewBox="0 0 428 459" fill="none" xmlns="http://www.w3.org/2000/svg">
        <g filter="url(#filter0_f_1_9)">
          <path d="M211.76 251.893C252.437 257.839 284.97 364.837 287.558 295.009C290.145 225.18 259.215 147.128 218.538 141.183C177.861 135.238 142.84 203.651 140.253 273.479C137.665 343.308 171.082 245.948 211.76 251.893Z" fill="url(#paint0_linear_1_9)" />
        </g>
        <defs>
          <filter id="filter0_f_1_9" x="0.111717" y="0.821381" width="427.597" height="457.756" filterUnits="userSpaceOnUse" color-interpolation-filters="sRGB">
            <feFlood flood-opacity="0" result="BackgroundImageFix" />
            <feBlend mode="normal" in="SourceGraphic" in2="BackgroundImageFix" result="shape" />
            <feGaussianBlur stdDeviation="70" result="effect1_foregroundBlur_1_9" />
          </filter>
          <linearGradient id="paint0_linear_1_9" x1="142.448" y1="214.242" x2="290.347" y2="219.723" gradientUnits="userSpaceOnUse">
            <stop stop-color="#FFE924" />
            <stop offset="1" stop-color="#ECFF79" stop-opacity="0.32" />
          </linearGradient>
        </defs>
      </svg>
  
      <svg class="svg3" viewBox="0 0 465 408" fill="none" xmlns="http://www.w3.org/2000/svg">
        <g filter="url(#filter0_f_1_11)">
          <path d="M131.708 242.056C147.41 133.679 218.698 131.25 252.379 143.583C257.225 132.578 277.604 117.172 320.348 143.583C341.429 160.09 350.806 159.976 351.969 225.549C353.132 291.122 320.953 311.69 304.718 313.777H202.584C172.416 335.027 116.006 350.434 131.708 242.056Z" fill="#DD8A8A" fill-opacity="0.79" />
        </g>
        <defs>
          <filter id="filter0_f_1_11" x="0" y="0" width="481" height="458" filterUnits="userSpaceOnUse" color-interpolation-filters="sRGB">
            <feFlood flood-opacity="0" result="BackgroundImageFix" />
            <feBlend mode="normal" in="SourceGraphic" in2="BackgroundImageFix" result="shape" />
            <feGaussianBlur stdDeviation="90" result="effect1_foregroundBlur_1_11" />
          </filter>
        </defs>
      </svg>

    </div>
    <div class="card" style="">
        ${(() => {
          const data = airPollution.filter((d) =>
            ["United Kingdom", "United States", "India", "China", "World"].includes(
              d.Entity
            )
          );
      
          return Plot.plot({
        marks: [
          Plot.line(data, {
            x: "Year",
            y: "Non-methane volatile organic compounds (NMVOC) emissions",
            z: "Entity",
            stroke: "Entity",
            tip: true
          }),
          Plot.ruleX(
            data,
            Plot.pointerX({
              x: "Year",
              py: "Non-methane volatile organic compounds (NMVOC) emissions",
              z: "Entity",
              stroke: "red"
            })
          ),
          Plot.dot(
            data,
            Plot.pointerX({
              x: "Year",
              y: "Non-methane volatile organic compounds (NMVOC) emissions",
              z: "Entity",
              stroke: "red"
            })
          ),
          Plot.text(
            data,
            Plot.selectLast({
              x: "Year",
              y: "Non-methane volatile organic compounds (NMVOC) emissions",
              z: "Entity",
              text: "Entity",
              textAnchor: "start",
              dx: -3,
              dy: 9
            })
          )
        ],
        y: {
          type: "linear",
          grid: true,
          nice: true,
          tickFormat: (d) => (d === 0 ? "0" : d / 1e6 + "M t"), // Format tick values in millions and append "t"
          domain: d3.extent(data, (d) => d["Non-methane volatile organic compounds (NMVOC) emissions"]), // Set the maximum value 
          ticks: 8 // Set the number of ticks to 8, with a step of 20M
        },
        color: {
          scheme: "spectral",
          legend: true
        },
        title: "Non-methane volatile organic compounds (NMVOC) emissions Trend",
        width
      });
        })()}
    </div>
  </div>
</div>
```

![](https://cdn.hashnode.com/res/hashnode/image/upload/v1722613937825/9fa4b73a-f6b2-4bcf-9cb9-9314dea85506.png)


# Conclusion

Learning Objectives,

1. Data Ingestion
2. Data Transformation
3. Observable Notebook
4. Data Visualization

- filter data
- vertical ruler
- text at end of line
- Visualization
- filter data
- vertical ruler
- text at end of line
- Visualization
- improved scale units.

# Source: Observablehq EIA \[[Link](https://observablehq.observablehq.cloud/framework-example-eia/)\]

# Author: Dheeraj. Yss

# Connect with me:

- [My Twitter](https://twitter.com/yssdheeraj)
- [My LinkedIn](https://www.linkedin.com/in/dheerajy1/)
- [My GitHub](https://github.com/dheerajy1)
- [My Hashnode](https://dheerajy1.hashnode.dev/)
