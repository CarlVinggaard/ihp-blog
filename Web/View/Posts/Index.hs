module Web.View.Posts.Index where
import Web.View.Prelude
import Data.Aeson

data IndexView = IndexView { posts :: [Post] }

instance View IndexView where
    html IndexView { .. } = [hsx|
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item active"><a href={PostsAction}>Posts</a></li>
            </ol>
        </nav>
        <h1>Index <a href={pathTo NewPostAction} class="btn btn-primary ml-4">+ New</a></h1>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>Post</th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>{forEach posts renderPost}</tbody>
            </table>
        </div>
    |]

    json IndexView { .. } = toJSON posts

instance ToJSON Post where
    toJSON post = object
        [ "id" .= get #id post
        , "title" .= get #title post
        , "body" .= get #body post
        ]

renderPost post = [hsx|
    <tr>
        <td>{get #title post}</td>
        <td><a href={ShowPostAction (get #id post)}>Show</a></td>
        <td><a href={EditPostAction (get #id post)} class="text-muted">Edit</a></td>
        <td><a href={DeletePostAction (get #id post)} class="js-delete text-muted">Delete</a></td>
    </tr>
|]