//
//  Data.swift
//  MicroPlastic Tracker
//
//  Created by 李柏霖 on 2025/2/11.
//

let salp = BiologyInfo(
    type: .salp,
    scientificName: "\"Salpa spp.\"",
    introduction: "Salps are barrel-shaped, planktonic tunicates found in equatorial, temperate, and cold seas. They move by contracting their gelatinous bodies, pumping water through and feeding on phytoplankton.",
    characteristics: "Salps have transparent, tubular bodies that can range from 1 to 10 cm in length. They are known for their efficient jet propulsion and often form long chains or colonies.",
    habitat: "Commonly found at the surface of equatorial, temperate, and cold seas, either singly or in long, stringy colonies.",
    size: "1.0",
    torphicLevel: .primaryProducer,
    microplastic: BiologyInfo.requirements[.salp]!
)

let northernPrawn = BiologyInfo(
    type: .shrimp,
    scientificName: "\"Pandalus borealis\"",
    introduction: "The Northern Prawn, also known as the Northern Shrimp, is a species of caridean shrimp found in cold parts of the northern Atlantic and northern Pacific Oceans. It is a significant species in commercial fisheries and plays a crucial role in marine ecosystems.",
    characteristics: "Northern Prawns have a semi-transparent pinkish body with long antennae and a segmented exoskeleton. They are protandric hermaphrodites, starting life as males and later becoming females.",
    habitat: "Soft muddy bottoms at depths of 20 to 1,330 meters in cold waters with temperatures ranging from 0 to 8°C.",
    size: "16.5",
    torphicLevel: .primaryConsumer,
    microplastic: BiologyInfo.requirements[.shrimp]!
)

let anchovy = BiologyInfo(
    type: .anchovy,
    scientificName: "\"Engraulidae\"",
    introduction: "Anchovies belong to the family Engraulidae, commonly found in marine waters across the Atlantic, Indian, and Pacific Oceans. They play a crucial role in marine ecosystems and are an important food source for many larger fish.",
    characteristics: "Anchovies are small, fusiform fish with a typical length between 10-20 cm. They have a large mouth extending beyond their eyes and a silver stripe along their body.",
    habitat: "Typically inhabit shallow coastal waters, estuaries, and bays with muddy bottoms, capable of adapting to varying salinities and temperatures.",
    size: "10.0",
    torphicLevel: .secondaryConsumer,
    microplastic: BiologyInfo.requirements[.anchovy]!
)


let skipjackTuna = BiologyInfo(
    type: .skipjackTuna,
    scientificName: "\"Katsuwonus pelamis\"",
    introduction: "The skipjack tuna is a pelagic fish found in tropical and warm-temperate waters worldwide. It is a significant species for global fisheries and is known for its importance in various cuisines.",
    characteristics: "Skipjack tunas have streamlined bodies built for speed, with a metallic blue coloration on the dorsal side and silver on the ventral side. They can grow up to 1 meter in length.",
    habitat: "Inhabit tropical and warm-temperate oceans worldwide, often found in large schools in surface waters.",
    size: "100.0",
    torphicLevel: .tertiaryConsumer,
    microplastic: BiologyInfo.requirements[.skipjackTuna]!
)

let atlanticBlueMarlin = BiologyInfo(
    type: .marlin,
    scientificName: "\"Makaira nigricans\"",
    introduction: "The Atlantic blue marlin is a large, migratory billfish found in tropical and subtropical oceans worldwide. Known for its speed and strength, it is a prized species in recreational and commercial fisheries.",
    characteristics: "Atlantic blue marlins have elongated, streamlined bodies with a sharp bill used for slashing through schools of fish. They exhibit a striking cobalt blue color on their dorsal side and silver-white ventral side.",
    habitat: "Inhabit tropical and subtropical waters of the Atlantic Ocean, preferring warm, open waters. They are known for their extensive migrations across ocean basins.",
    size: "500.0",
    torphicLevel: .apexPredator,
    microplastic: BiologyInfo.requirements[.marlin]!
)


let human = BiologyInfo(
    type: .human,
    scientificName: "\"Homo sapiens\"",
    introduction: "Humans are highly intelligent primates known for their advanced cognitive abilities, complex social structures, and significant impact on the Earth's ecosystems.",
    characteristics: "Humans have an upright posture, bipedal locomotion, and highly developed brains capable of abstract reasoning, language, introspection, and problem-solving.",
    habitat: "Humans inhabit diverse environments across the globe, from urban areas to rural regions, adapting to various climates and geographies.",
    size: "170",
    torphicLevel: .topPredator,
    microplastic: BiologyInfo.requirements[.human]!
)
