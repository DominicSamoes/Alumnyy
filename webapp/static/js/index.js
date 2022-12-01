function deletePost(postId) {
    fetch("/delete_post", {
        method: "POST",
        body: JSON.stringify({ postId: postId})
    }).then((_res) => {
        window.location.href= "/post";
    });
}