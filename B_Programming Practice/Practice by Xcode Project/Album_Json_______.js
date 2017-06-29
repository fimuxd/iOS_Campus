// Album Json

{
// 사용시 주석 제거 필요.
	"ID": Int, //앨범의 고유 key 값
	"Name": String, //앨범 이름
	"Artist": {"kor": String, "Eng": String}, //아티스트 이름
	"Category": String, //앨범 종류 ex. LP(정규), Single(싱글), EP(미니), DigitalSingle(디지털싱글), Remix(리믹스), Repackage(리패키지)
	"ReleaseDate": Int, //발매일 ex. 20170622
	"Genre": [String], //장르 ex.발라드/댄스/팝, 힙합/알앤비
	"Style": [String], //스타일 ex.발라드, 알앤비, 팝
	"Agency": String, //기획사 ex.페이브엔터테인먼트
	"Publishers": String, //유통사 ex.로엔엔터테인먼트
	"Time": Int, //전체 재생 시간 ex. 003901
	"AlbumArtUrl": [String], //앨범 아트 URL - 여러개의 앨범 아트 저장
	"About": String, //앨범 소개
	"Like": Int, //앨범 좋아요 개수
	"Country": String, //발매 국가
	"Track": [{
		"ID": Int, //곡의 고유 key 값
		"Name": String, //곡 제목
		"Lyrics": [String], //곡 재생할 때, 해당되는 부분의 가사가 보이도록 배열로 설계
		"Like": Int, //곡 좋아요 개수
		"Featuring": String, //피쳐링
		"SongWriter": String, //작사가
		"Composer": String, //작곡가
		"Arranger": String, //편곡가
		"Time": Int, //재생 시간 //ex. 000322
		"TitleSong": Bool, //타이틀곡 여부 - 타이틀곡이 여러개인 경우를 위해 곡 데이터에 저장
		"AdultOnly": Bool //19금 곡 여부
	}]
}

// Example
{
	"ID": 1,
	"Name": "Palette",
	"Artist": {"kor": "아이유(IU)", "Eng": "IU"},
	"Category": "정규",
	"ReleaseDate": 20170421,
	"Genre": ["발라드/댄스/팝", "힙합/알앤비"],
	"Style": ["발라드", "알앤비", "팝"],
	"Agency": "페이브엔터테인먼트",
	"Publishers": "로엔엔터테인먼트",
	"Time": 3901,
	"AlbumArtUrl": ["http://image.bugsm.co.kr/album/images/1000/200941/20094140.jpg", "http://image.bugsm.co.kr/album/images/1000/200941/20094140_in001.jpg", "http://image.bugsm.co.kr/album/images/1000/200941/20094140_in002.jpg", "http://image.bugsm.co.kr/album/images/1000/200941/20094140_in003.jpg", "http://image.bugsm.co.kr/album/images/1000/200941/20094140_in004.jpg"],
	"About": "작은 순간순간을 예쁜 물감으로 만들어, 아이유의 '이 지금'을 빼곡히 채워내다.<br />'아이유(IU)' 정규4집 [Palette] 전격 발매!<br />아이유(IU)의 네 번째 정규앨범 [Palette]가 드디어 공개됐다.",
	"Like": 9999999999,
	"Country": "Korea",
	"Track": [{
		"ID": 1,
		"Name": "이 지금",
		"Lyrics": ["이건 비밀이야","아무에게도 고백하지 않았던","이야기를 들려주면","큰 눈으로 너는 묻지","How wow wow Whatever"],
		"Like": 9999999999,
		"Featuring": null,
		"SongWriter": "아이유(IU)",
		"Composer": "김제휘",
		"Arranger": "김제휘",
		"Time": 256,
		"TitleSong": false,
		"AdultOnly": false
	}]
}