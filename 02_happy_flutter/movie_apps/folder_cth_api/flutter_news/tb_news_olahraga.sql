-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 06, 2019 at 01:53 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_news_sport`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_news_olahraga`
--

CREATE TABLE `tb_news_olahraga` (
  `id_berita` int(11) NOT NULL,
  `tanggal_berita` datetime NOT NULL DEFAULT current_timestamp(),
  `judul_berita` varchar(100) NOT NULL,
  `isi_berita` text NOT NULL,
  `gbr_berita` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_news_olahraga`
--

INSERT INTO `tb_news_olahraga` (`id_berita`, `tanggal_berita`, `judul_berita`, `isi_berita`, `gbr_berita`) VALUES
(1, '2019-10-06 05:07:33', 'Spiderman', 'Spider-Man is a fictional superhero created by writer-editor Stan Lee and writer-artist Steve Ditko. He first appeared in the anthology comic book Amazing Fantasy #15 (August 1962) in the Silver Age of Comic Books. He appears in American comic books published by Marvel Comics, as well as in a number of movies, television shows, and video game adaptations set in the Marvel Universe. In the stories, Spider-Man is the alias of Peter Parker, an orphan raised by his Aunt May and Uncle Ben in New York City after his parents Richard and Mary Parker were killed in a plane crash. Lee and Ditko had the character deal with the struggles of adolescence and financial issues, and accompanied him with many supporting characters, such as J. Jonah Jameson, Harry Osborn, Max Modell, romantic interests Gwen Stacy and Mary Jane Watson, and foes such as Doctor Octopus, Green Goblin and Venom. His origin story has him acquiring spider-related abilities after a bite from a radioactive spider; these include clinging to surfaces, shooting spider-webs from wrist-mounted devices, and detecting danger with his \"spider-sense\".', 'spiderman.jpg'),
(2, '2019-10-06 05:07:33', 'Iron Man', 'Iron Man is a fictional superhero appearing in American comic books published by Marvel Comics. The character was co-created by writer and editor Stan Lee, developed by scripter Larry Lieber, and designed by artists Don Heck and Jack Kirby. The character made his first appearance in Tales of Suspense #39 (cover dated March 1963), and received his own title in Iron Man #1 (May 1968).\r\n\r\nA wealthy American business magnate, playboy, and ingenious scientist, Anthony Edward \"Tony\" Stark suffers a severe chest injury during a kidnapping. When his captors attempt to force him to build a weapon of mass destruction, he instead creates a mechanized suit of armor to save his life and escape captivity. Later, Stark develops his suit, adding weapons and other technological devices he designed through his company, Stark Industries. He uses the suit and successive versions to protect the world as Iron Man. Although at first concealing his true identity, Stark eventually declared that he was, in fact, Iron Man in a public announcement.', 'ironman.jpg'),
(3, '2019-10-06 05:09:09', 'Thor', 'As the son of Odin (Anthony Hopkins), king of the Norse gods, Thor (Chris Hemsworth) will soon inherit the throne of Asgard from his aging father. However, on the day that he is to be crowned, Thor reacts with brutality when the gods\' enemies, the Frost Giants, enter the palace in violation of their treaty. As punishment, Odin banishes Thor to Earth. While Loki (Tom Hiddleston), Thor\'s brother, plots mischief in Asgard, Thor, now stripped of his powers, faces his greatest threat.', 'thor.jpg'),
(4, '2019-10-06 05:09:09', 'Captain America', 'Captain America is a fictional superhero appearing in American comic books published by Marvel Comics. Created by cartoonists Joe Simon and Jack Kirby, the character first appeared in Captain America Comics #1 (cover dated March 1941) from Timely Comics, a predecessor of Marvel Comics. Captain America was designed as a patriotic supersoldier who often fought the Axis powers of World War II and was Timely Comics\' most popular character during the wartime period. The popularity of superheroes waned following the war and the Captain America comic book was discontinued in 1950, with a short-lived revival in 1953. Since Marvel Comics revived the character in 1964, Captain America has remained in publication.\r\n\r\nThe character wears a costume bearing an American flag motif, and he utilizes a nearly indestructible shield which he throws as a projectile. Captain America is the alter ego of Steve Rogers, a frail young man enhanced to the peak of human perfection by an experimental serum to aid the United States government\'s efforts in World War II. Near the end of the war, he was trapped in ice and survived in suspended animation until he was revived in the present day. Although Captain America often struggles to maintain his ideals as a man out of his time with its modern realities, he remains a highly respected figure in his community which includes becoming the long-time leader of the Avengers.', 'captainamerica.jpg'),
(5, '2019-10-06 05:10:06', 'Black Panther', 'After the death of his father, T\'Challa returns home to the African nation of Wakanda to take his rightful place as king. When a powerful enemy suddenly reappears, T\'Challa\'s mettle as king -- and as Black Panther -- gets tested when he\'s drawn into a conflict that puts the fate of Wakanda and the entire world at risk. Faced with treachery and danger, the young king must rally his allies and release the full power of Black Panther to defeat his foes and secure the safety of his people.', 'blackpanther.jpg'),
(12, '2019-10-06 18:23:30', 'Zombieland', 'Zombie slayers Tallahassee, Columbus, Wichita and Little Rock square off against the newly evolved undead.', 'zombieland.jpg'),
(13, '2019-10-06 18:24:43', 'Gundala', 'Gundala is a 2019 Indonesian superhero film based on the comics character Gundala created by Harya (Hasmi) Suraminata in 1969, co-produced by Screenplay Films and BumiLangit Studios, and distributed by Legacy Pictures. It is the first installment in the BumiLangit Cinematic Universe.', 'gundala.jpeg'),
(14, '2019-10-06 18:26:17', 'Tenggelamnya Kapal Van Der Wijk', 'Zainuddin, a Minang-Mengkasar descent raised by his auntie, decides to go to Padang to deliver his deceased father\'s last message about his homeland.', 'vanderwijk.jpeg'),
(15, '2019-10-06 18:27:31', 'Joker', 'Forever alone in a crowd, failed comedian Arthur Fleck seeks connection as he walks the streets of Gotham City. Arthur wears two masks -- the one he paints for his day job as a clown, and the guise he projects in a futile attempt to feel like he\'s part of the world around him. Isolated, bullied and disregarded by society, Fleck begins a slow descent into madness as he transforms into the criminal mastermind known as the Joker.', 'joker.jpg'),
(16, '2019-10-06 18:28:19', 'Train To Busan', 'A man (Gong Yoo), his estranged daughter and other passengers become trapped on a speeding train during a zombie outbreak in South Korea.', 'traintobusan.jpg'),
(17, '2019-10-06 18:29:11', 'War World Z', 'When former U.N. investigator Gerry Lane (Brad Pitt) and his family get stuck in urban gridlock, he senses that it\'s no ordinary traffic jam. His suspicions are confirmed when, suddenly, the city erupts into chaos. A lethal virus, spread through a single bite, is turning healthy people into something vicious, unthinking and feral. As the pandemic threatens to consume humanity, Gerry leads a worldwide search to find the source of the infection and, with luck, a way to halt its spread.', 'warworldz.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_news_olahraga`
--
ALTER TABLE `tb_news_olahraga`
  ADD PRIMARY KEY (`id_berita`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_news_olahraga`
--
ALTER TABLE `tb_news_olahraga`
  MODIFY `id_berita` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
