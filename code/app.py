from flask import Flask, request
from flask_restful import Resource, Api, reqparse

app = Flask(__name__)
api = Api(app)


class Contacts(Resource):
    def post(self):
        parser = reqparse.RequestParser()
        parser.add_argument('name',
                            # type=string,
                            required=True,
                            help="Contact must have a name")
        parser.add_argument('email',
                            # type=string,
                            required=True,
                            help="Contact must have a valid email")

        # data = request.get_json()
        data = parser.parse_args()
        # name = data['name']
        # email = data['email']
        return {'message': 'Contact Authenticated'}

    def delete(self):
        # data = request.get_json()
        return {'message': 'Contact Deleted'}


api.add_resource(Contacts, '/home')

app.run(port=5000, debug=True)
