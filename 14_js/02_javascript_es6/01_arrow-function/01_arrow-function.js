let theater = {
    store: '강남점',
    titles: ['세계의 주인', '굿 보이', '부산 포니아', '디바 야누스', '콘스탄틴'],
    showMovieList() {
        this.titles.forEach(
            title => console.log(this.store + ":" + title)
        );
    }
}

theater.showMovieList();